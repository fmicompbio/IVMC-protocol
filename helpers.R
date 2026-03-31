# ------------------------------------------------------------------------------
# Helper functions
# ------------------------------------------------------------------------------
## Replace the get_legend function from cowplot temporarily,
## since the cowplot one doesn't work with ggplot2 3.5.0
## see https://github.com/wilkelab/cowplot/issues/202

get_legend2 <- function(plot, legend = NULL) {
    gt <- ggplotGrob(plot)

    pattern <- "guide-box"
    if (!is.null(legend)) {
        pattern <- paste0(pattern, "-", legend)
    }

    indices <- grep(pattern, gt$layout$name)

    not_empty <- !vapply(
        gt$grobs[indices],
        inherits, what = "zeroGrob",
        FUN.VALUE = logical(1)
    )
    indices <- indices[not_empty]

    if (length(indices) > 0) {
        return(gt$grobs[[indices[1]]])
    }
    return(NULL)
}

.get_empty_label <- function(x) {
    c("ciliated" = "", "non-ciliated" = "")
}

# Function to create normalized dot plots
.makeDotPlot <- function(dat, markers, cluster_column, cluster_order,
                         cluster_colors, cluster_labels = NULL, transpose = TRUE,
                         split_by_ciliated = FALSE, normalize = TRUE,
                         subset_to_clusters = NULL,
                         min_fraction = 0) {
    # average expression
    averages <- assay(sumCountsAcrossCells(
        as.matrix(assay(dat, "logcounts")[markers, , drop = FALSE]),
        dat[[cluster_column]],
        average = TRUE, store.number = NULL)
    )

    # fraction of cells where gene is detected
    ndetected <- assay(numDetectedAcrossCells(
        as.matrix(assay(dat, "logcounts")[markers, , drop = FALSE]),
        dat[[cluster_column]], average = TRUE)
    )

    stopifnot(rownames(averages) == rownames(ndetected),
              colnames(averages) == colnames(ndetected))
    if (min_fraction > 0) {
        # keep only genes that are detected in at least a certain fraction in 
        # at least one group
        keep <- which(rowMaxs(ndetected) >= min_fraction)
        averages <- averages[keep, , drop = FALSE]
        ndetected <- ndetected[keep, , drop = FALSE]
    }
    plot.data <- data.frame(
        Feature = factor(rep(rownames(averages), ncol(averages)),
                         levels = rownames(averages)),
        Group = rep(colnames(averages), each = nrow(averages)),
        Average = as.numeric(averages),
        Detected = as.numeric(ndetected)
    ) |>
        mutate(Group2 = ifelse(grepl("ciliated", Group), "ciliated", "non-ciliated")) |>
        mutate(dummy = Group2)

    if (normalize) {
        # scale average expressions per gene
        plot.data <- plot.data |>
            group_by(Feature) |>
            mutate(Average = (Average - min(Average)) / (max(Average) - min(Average))) |>
            ungroup()
    }

    # subset to requested clusters
    if (!is.null(subset_to_clusters)) {
        plot.data <- plot.data |> 
            filter(Group %in% subset_to_clusters)
    }
    
    # reorder groups
    if (is.null(cluster_labels)) {
        plot.data <- plot.data |> 
            mutate(Group = factor(Group, levels = rev(cluster_order))) |>
            arrange(Group) |>
            mutate(Group = as.character(Group)) |>
            mutate(Group = paste("<span style = 'color: ",
                                 cluster_colors[Group],
                                 ";'>",
                                 Group,
                                 "</span>", sep = "")) |>
            mutate(Group = factor(Group, levels = unique(Group)))
    } else {
        plot.data <- plot.data |> 
            mutate(Group = factor(Group, levels = rev(cluster_order))) |>
            arrange(Group) |>
            mutate(Group = as.character(Group)) |>
            mutate(Group = paste("<span style = 'color: ",
                                 cluster_colors[Group],
                                 ";'>",
                                 cluster_labels[Group],
                                 "</span>", sep = "")) |>
            mutate(Group = factor(Group, levels = unique(Group)))
    }

    # plot
    gg <- ggplot(plot.data) +
        geom_point(aes(x = Group, y = Feature, size = Detected, col = Average)) +
        scale_size(limits = c(0.2, max(plot.data$Detected))) +
        scale_color_gradientn(colours = dotplot_colors(seq(0, 7.5, length.out = 100))) +
        theme(panel.background = element_rect(fill = "white"),
              panel.grid.major = element_line(linewidth = 0.5, colour = "grey80"),
              panel.grid.minor = element_line(linewidth = 0.25, colour = "grey80"),
              axis.title = element_blank(),
              axis.ticks = element_blank())
    if (transpose) {
        gg <- gg +
            coord_flip() +
            theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size = 14),
                  axis.text.y = element_markdown(size = 14))
    } else {
        gg <- gg +
            theme(axis.text.y = element_text(size = 14),
                  axis.text.x = element_markdown(angle = 90, vjust = 0.5, hjust = 1, size = 14))
    }
    if (split_by_ciliated) {
        gg <- gg +
            scale_x_discrete(expand = expansion(mult = c(0, 0), add = c(0.5, 0.5))) +
            facet_nested(Group2 + dummy ~ ., scales = "free", space = "free",
                         switch = "y", nest_line = element_line(linewidth = 1),
                         solo_line = TRUE, resect = unit(2, "mm"), render_empty = TRUE,
                         labeller = labeller(dummy = .get_empty_label,
                                             Group2 = "label_value")) +
            theme(strip.placement = "outside",
                  strip.background = element_rect(color = "transparent", fill = "transparent"),
                  strip.text = element_text(size = 14),
                  panel.spacing = unit(0, "lines"))
    }
    gg
}

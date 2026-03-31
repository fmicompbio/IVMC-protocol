# ------------------------------------------------------------------------------
# bulk RNAseq timecourse
# ------------------------------------------------------------------------------
bulk_timepoint_colors <- c(
    "tp0" = "#e6e6e6",
    "Pre-diff" = "#e6e6e6",
    "tp1" = "#5e17d1",
    "P4-diff" = "#5e17d1",
    "tp2" = "#989692",
    "Horm\nWithdr 24h" = "#989692",
    "Horm Withdr 24h" = "#989692",
    "H. W.\n24h" = "#989692",
    "H. W. 24h" = "#989692",   
    "tp3" = "#989692",
    "Horm\nWithdr 48h" = "#989692",
    "Horm Withdr 48h" = "#989692",
    "H. W.\n48h" = "#989692",
    "H. W. 48h" = "#989692",   
    "tp4" = "#cb3b63",
    "Repair\n24h" = "#cb3b63",
    "Repair 24h" = "#cb3b63",
    "Post-breakdown\n24h" = "#cb3b63",
    "Post-breakdown 24h" = "#cb3b63",
    "P. B. 24h" = "#cb3b63",
    "tp5" = "#debaf5",
    "E2-diff\n24h" = "#debaf5",
    "E2-diff 24h" = "#debaf5",
    "tp6" = "#BE9FD2",
    "E2-diff\n48h" = "#BE9FD2",
    "E2-diff 48h" = "#BE9FD2"
)

bulk_timepoint_map_sl <- c(
    tp0 = "Pre-diff", tp1 = "P4-diff", tp2 = "Horm Withdr 24h",
    tp3 = "Horm Withdr 48h", tp4 = "Post-breakdown 24h", tp5 = "E2-diff 24h",
    tp6 = "E2-diff 48h"
)
bulk_timepoint_map_mll <- c(
    tp0 = "Pre-diff", tp1 = "P4-diff", tp2 = "Horm\nWithdr 24h",
    tp3 = "Horm\nWithdr 48h", tp4 = "Post-breakdown\n24h", tp5 = "E2-diff\n24h",
    tp6 = "E2-diff\n48h"
)
bulk_timepoint_map_mlm <- c(
    tp0 = "Pre-diff", tp1 = "P4-diff", tp2 = "Horm Withdr\n24h",
    tp3 = "Horm Withdr\n48h", tp4 = "Post-breakdown\n24h", tp5 = "E2-diff\n24h",
    tp6 = "E2-diff\n48h"
)
bulk_timepoint_map_mls <- c(
    tp0 = "Pre-diff", tp1 = "P4-diff", tp2 = "H. W.\n24h",
    tp3 = "H. W.\n48h", tp4 = "P. B.\n24h", tp5 = "E2-diff\n24h",
    tp6 = "E2-diff\n48h"
)

breakdown_colors <- c(
    NB = "#7f7f7f", 
    B = "#A30B2E"
)
hormones_colors <- c(
    NH = "#CCCCC4",
    H = "#00C5CD"
)
donor_colors <- c(
    B032 = "#670E10",
    B044 = "#63B7B7",
    B050 = "#FF9966",
    B066 = "#006400",
    B078 = "#4F86F7",
    B080 = "#a6761d"
)

# for volcano plots
down <- "Down"
notsig <- "Not Sig"
up <- "Up"
volcano_colors <- setNames(c("cornflowerblue", "grey", "firebrick"), c(down, notsig, up))

# ------------------------------------------------------------------------------
# scRNAseq timecourse
# ------------------------------------------------------------------------------
sc_timepoint_colors <- c(
    "Horm Withdr 48h" = "grey40",
    "Post-breakdown 12h" = "#f3a9c0",
    "Post-breakdown 24h" = "#e27897",
    "Post-breakdown 48h" = "#cb3b63",
    "E2-diff 24h" = "#debaf5",
    "E2-diff 48h" = "#BE9FD2"
)
sc_timepoint_order <- names(sc_timepoint_colors)

sc_leiden_res0.125_annot_colors <- c(
    "ciliated" = "royalblue",
    "ciliated immunomodulatory" = "tan1",
    "ciliated wound responsive 24h" = "turquoise4",
    "ciliated wound responsive 12h" = "turquoise",
    "ciliated stress responsive" = "navy",
    "ciliated cycling" = "olivedrab2",
    "pre-ciliated" = "lightskyblue",
    "secretory late" = "firebrick",
    "secretory early" = "firebrick1",
    "hormone responsive" = "orchid3",
    "immunomodulatory" = "#FF6347",
    "OxPhos high" = "coral4",
    "wound responsive 24h" = "goldenrod1",
    "wound responsive 12h" = "navajowhite",
    "stress responsive" = "grey20",
    "cycling" = "forestgreen"
)

sc_leiden_res0.125_annot_order <- names(sc_leiden_res0.125_annot_colors)

# marker genes (for dot plot)
sc_timecourse_markers <- c( 
    "MKI67", "PCNA", "BIRC5", "MCM7", "HSPA1A", "DNAJB1", "GADD45A", "JUN", 
    "EGR1", "ARC", "CCN1", "CCN2", "RRS1", "LYAR", "F3", "TNFRSF12A", "DKK1", 
    "SFN", "FGF2", "IFRD1", "WWC1", "SEMA7A", "MALT1", "ADAMTS9", "LDLR", 
    "ZNRF3", "SH3RF2", "WEE1", "AMOTL1", "PDGFA", "EDN2", "CXCL8", "CXCL3",
    "PLAU", "PLAUR", "WNT7A", "CD47", "MMP7", "IL32", "KRT17", "TNF", "TNFAIP2", 
    "IL1R1", "CXCL10", "VTCN1", "IRAK2", "CSF1", "LIF", "SAA1", "SAA2", 
    "ESR1", "PGR", "SOX17", "LGR5", "LGR4", "COL1A2", "ALDH1A1", "CDH2", 
    "SCGB1D2", "SCGB2A1", "PTGS2", "MT1F", "CALB1", "PAX8", "SERPINA5", "C3", 
    "MUC5B", "PAEP", "PAX2", "EGLN3", "HILPDA", "CCNO", "E2F7", "MCIDAS", 
    "CDC20B", "MAD2L1", "CRELD2", "DNAJB11", "NEK2", "PIFO", "FOXJ1", 
    "RSPH1", "TPPP3") 

sc_leiden_res0.125_annot_labels <- c(
    "ciliated" = "ciliated",
    "ciliated immunomodulatory" = "ciliated immunomodulatory",
    "ciliated wound responsive 24h" = "ciliated wound responsive 24h",
    "ciliated wound responsive 12h" = "ciliated wound responsive 12h",
    "ciliated stress responsive" = "ciliated stress responsive",
    "ciliated cycling" = "ciliated cycling",
    "pre-ciliated" = "pre-ciliated",
    "secretory late" = "secretory PAEP<sup>+</sup>",
    "secretory early" = "secretory SCGB<sup>high</sup>",
    "hormone responsive" = "hormone responsive",
    "immunomodulatory" = "immunomodulatory",
    "OxPhos high" = "OxPhos high",
    "wound responsive 24h" = "wound responsive 24h",
    "wound responsive 12h" = "wound responsive 12h",
    "stress responsive" = "stress responsive",
    "cycling" = "cycling"
)

# ------------------------------------------------------------------------------
# scRNAseq tissue atlas (epithelial)
# ------------------------------------------------------------------------------
tissue_leiden_res0.4_annot_colors <- c(
    "ciliated" = "royalblue",
    "pre-ciliated" = "lightskyblue",
    "secretory late" = "#3A1260",
    "secretory mid" = "#7D4DBA",
    "secretory early" = "#C8AEE2",
    "hormone responsive late" = "hotpink4",
    "hormone responsive early" = "hotpink2",
    "luminal late" = "darkorange",
    "luminal early" = "gold1",
    "KRT5+" = "firebrick",
    "MUC5B+" = "salmon",
    "transcriptionally active" = "turquoise4",
    "remodeling" = "#4CAF50",
    "cycling" = "mediumaquamarine"
)
tissue_leiden_res0.4_annot_order <- names(tissue_leiden_res0.4_annot_colors)

tissue_leiden_res0.4_annot_labels <- c(
    "ciliated" = "ciliated",
    "pre-ciliated" = "pre-ciliated",
    "secretory late" = "secretory late",
    "secretory mid" = "secretory mid",
    "secretory early" = "secretory early",
    "hormone responsive late" = "hormone responsive PGR<sup>low</sup>",
    "hormone responsive early" = "hormone responsive PGR<sup>high</sup>",
    "luminal late" = "receptivity associated luminal",
    "luminal early" = "regeneration associated luminal",
    "KRT5+" = "KRT5<sup>+</sup>",
    "MUC5B+" = "MUC5B<sup>+</sup>",
    "transcriptionally active" = "transcriptionally active",
    "remodeling" = "VIM<sup>+</sup>",
    "cycling" = "cycling"
)

tissue_markers <- c(
    "PAX8", "EPCAM", "FOXA2", "MKI67", "STMN1", "PCNA", "VIM", "NABP1",
    "TEAD1", "NKTR", "PNN", "MACF1", "PHLDA1", "KRT5", "KRT17", "CLU",
    "LY6E", "C3", "PIGR", "MUC5B", "LCN2", "KRT23", "BPIFB1", "CFTR",
    "SAA1", "SAA2", "PLAUR", "PLAU", "IL32", "WNT7A", "CSF1", "CD47",
    "TNF", "MMP7", "ITGA2", "TNFRSF12A", "CLDN22", "SULT1E1", "LEFTY1",
    "PTGS1", "IL6", "LGR5", "PAX2", "MT1H", "ENPP3", "ESR1", "PGR", "AR",
    "COL1A2", "MMP26", "SOX17", "SCGB1D2", "SCGB2A1", "SCGB2A2", "IL6ST",
    "VEGFA", "VCAN", "DYNLT3", "MAOA", "PPIB", "GPX3", "PAEP", "TSPAN8",
    "NUPR1", "SOD3", "FGF7", "IGFBP7", "CCNO", "CDC20B", "MAD2L1", "NEK2",
    "MCIDAS", "GMNC", "PIFO", "FOXJ1", "RSPH1", "TPPP3")

tissue_goterms <- list(
    "luminal early" = c("epithelium development", "cell-cell junction organization",
                        "retina vasculature morphogenesis in camera-type eye",
                        "regulation of systemic arterial blood pressure by endothelin",
                        "epithelial cell differentiation",
                        "positive regulation of cell growth",
                        "response to wounding", "cell communication",
                        "cell migration", "regulation of protein localization",
                        "skin development", "tissue development",
                        "response to stimulus", "cell adhesion"),
    "luminal late" = c("gastrulation", "stem cell proliferation",
                       "fat cell differentiation",
                       "negative regulation of response to stimulus",
                       "p38MAPK cascade",
                       "positive regulation of intracellular mRNA localization",
                       "negative regulation of biological process",
                       "negative regulation of cell communication",
                       "response to growth factor",
                       "negative regulation of cellular process",
                       "negative regulation of signal transduction",
                       "regulation of programmed cell death",
                       "negative regulation of macromolecule metabolic process",
                       "response to corticotropin-releasing hormone"),
    "transcriptionally active" = c("nucleic acid metabolic process", 
                                   "RNA splicing", "gene expression",
                                   "cell-cell adhesion mediated by cadherin",
                                   "RNA metabolic process",
                                   "peptidyl-serine phosphorylation",
                                   "RNA biosynthetic process", 
                                   "nucleic acid biosynthetic process", 
                                   "negative regulation of hippo signaling", 
                                   "hippo signaling")
)

# ------------------------------------------------------------------------------
# endometrial atlas (all lineages)
# ------------------------------------------------------------------------------
tissue_all_lineages_celltype_cols <- c(
    Venous = "firebrick", 
    Arterial = "firebrick1",
    Lymphatic = "firebrick2",
    Mast_cell = "cyan2",
    pDC = "cyan2",
    cDC1 = "cyan4",
    cDC2 = "cyan4",
    Monocyte = "steelblue",
    eM1 = "steelblue1",
    eM2 = "steelblue3",
    ILC3 = "royalblue2",
    Peripheral_lymphocyte = "hotpink4",
    T_cell_CD4 = "plum1",
    T_cell_CD8 = "plum4",
    T_cell_cycling = "plum",
    T_Reg = "pink2",
    uNK1_cycling = "violetred4",
    uNK1 = "violetred4",
    uNK2 = "violetred2",
    uNK3 = "violetred4",
    B_cell = "red2",
    Plasma_B_cell = "red2",
    Red_blood_cell = "red2",
    uSMCs = "orchid",
    ePV = "bisque",
    mPV = "bisque3",
    eStromal = "seagreen1",
    dStromal = "seagreen4",
    Fibroblast_basalis = "green4",
    tissue_leiden_res0.4_annot_colors,
    HOXA13 = "grey90",
    sHormones = "grey70",
    dHormones = "grey70"
)
tissue_all_lineages_celltype_lineage <- c(
    Venous = "Endothelial", 
    Arterial = "Endothelial",
    Lymphatic = "Endothelial",
    Mast_cell = "Immune",
    pDC = "Immune",
    cDC1 = "Immune",
    cDC2 = "Immune",
    Monocyte = "Immune",
    eM1 = "Immune",
    eM2 = "Immune",
    ILC3 = "Immune",
    Peripheral_lymphocyte = "Immune",
    T_cell_CD4 = "Immune",
    T_cell_CD8 = "Immune",
    T_cell_cycling = "Immune",
    T_Reg = "Immune",
    uNK1_cycling = "Immune",
    uNK1 = "Immune",
    uNK2 = "Immune",
    uNK3 = "Immune",
    B_cell = "Immune",
    Plasma_B_cell = "Immune",
    Red_blood_cell = "Immune",
    uSMCs = "Mesenchymal",
    ePV = "Mesenchymal",
    mPV = "Mesenchymal",
    eStromal = "Mesenchymal",
    dStromal = "Mesenchymal",
    Fibroblast_basalis = "Mesenchymal",
    setNames(rep("Epithelial", length(tissue_leiden_res0.4_annot_colors)),
             names(tissue_leiden_res0.4_annot_colors)),
    HOXA13 = "Epithelial",
    sHormones = "Epithelial",
    dHormones = "Epithelial"
)
tissue_all_lineages_celltype_labels <- c(
    Venous = "Venous", 
    Arterial = "Arterial",
    Lymphatic = "Lymphatic",
    Mast_cell = "Mast_cell",
    pDC = "pDC",
    cDC1 = "cDC1",
    cDC2 = "cDC2",
    Monocyte = "Monocyte",
    eM1 = "eM1",
    eM2 = "eM2",
    ILC3 = "ILC3",
    Peripheral_lymphocyte = "Peripheral_lymphocyte",
    T_cell_CD4 = "T_cell_CD4",
    T_cell_CD8 = "T_cell_CD8",
    T_cell_cycling = "T_cell_cycling",
    T_Reg = "T_Reg",
    uNK1_cycling = "uNK1_cycling",
    uNK1 = "uNK1",
    uNK2 = "uNK2",
    uNK3 = "uNK3",
    B_cell = "B_cell",
    Plasma_B_cell = "Plasma_B_cell",
    Red_blood_cell = "Red_blood_cell",
    uSMCs = "uSMCs",
    ePV = "ePV",
    mPV = "mPV",
    eStromal = "eStromal",
    dStromal = "dStromal",
    Fibroblast_basalis = "Fibroblast_basalis",
    tissue_leiden_res0.4_annot_labels,
    HOXA13 = "HOXA13",
    sHormones = "sHormones",
    dHormones = "dHormones"
)

# ------------------------------------------------------------------------------
# other
# ------------------------------------------------------------------------------
cc_colors <- c(
    "S" = "gold",
    "G1" = "grey80",
    "G2M" = "brown"
)

dotplot_colors <- circlize::colorRamp2(
    breaks = c(0, 1.875, 3.75, 5.625, 7.5),
    colors = c("#d9d9d9", "#f4a582", "#d6604d", "#8b0000", "#5c0000")
)

stage_colors <- c(
    "early-secretory" = "#F4EBFA",
    "early-mid-secretory" = "#C8AEE2",
    "proliferative" = "hotpink2",
    "mid-secretory" = "#7D4DBA",
    "late-secretory" = "#3A1260",
    "menstrual" = "#A30B2E"
)

dataset_colors <- c(
    "GarciaAlonso" = "mediumaquamarine",
    "Shih" = "darkblue",
    "Wang" = "goldenrod1",
    "Huang" = "firebrick"
)

# ------------------------------------------------------------------------------
# Marker gene signatures (for plots)
# ------------------------------------------------------------------------------
luminal_early_genes <- c(
    "PLAU", "IL32", "WNT7A", "CSF1", "CD47", "TNF", "MMP7", "ITGA2",
    "TNFRSF12A", "NOTCH3", "EGFR", "ITGA3", "CRABP2", "TIMP2", "CLDN7",
    "CAMTA1", "FOSL1", "EDN1")
luminal_late_genes <- c(
    "CLDN22", "SULT1E1", "LEFTY1", "PTGS1", "IL6", "LGR5", "PAX2",
    "MT1H", "ENPP3", "GATA2", "LATS2", "LGR4", "SOCS3", "FOS", "FOSB",
    "NR4A3", "SCGB1D2", "SERPINA5", "ID1", "KLF10")


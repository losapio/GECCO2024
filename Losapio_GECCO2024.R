# R script to reproduce the results and figures of the manuscript "The effects of shrub encroachment on arthropod communities depend on grazing history" published in Global Ecology and Conservation. Feel free to reuse the code.
# Reference: Losapio, G., De Moraes, C.M., Nickels, V., Tscheulin, T., Zouros, N., Mescher, M.C. (2024) The effects of shrub encroachment on arthropod communities depend on grazing history. Global Ecology and Conservation
# Data are publicly available online at the ETH Research collection https://doi.org/10.3929/ethz-b-000311956

# load R packages
library(effects)
library(car)
library(MASS)
library(glmmTMB)
library(lme4)
library(reshape)
require(data.table)
library(BiodiversityR)
library(vegan)
library(lmerTest)
library(emmeans)

# load data
arthropoda1 <- read.csv("arthropoda1.csv")
# explore data set
head(arthropoda1)
summary(arthropoda1)
table(arthropoda1$CLASS)
table(arthropoda1$ORDER)

### summary table
art2 <- read.csv("art2")

# explore data set
head(art2)
summary(art2)

#################################################################
##### statistical analysis
## abundance 
mod.indart <- glmmTMB(abundance ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                      data=art2,
                      family = nbinom1)

Anova(mod.indart)
summary(mod.indart)

# effect size
round(summary(mod.indart)$coefficients$cond[-1,1]/(summary(mod.indart)$coefficients$cond[-1,2]*sqrt(72)),2)


# 
setEPS()
postscript("mod.indart.eps", width=3, height=3)
plot(allEffects(mod.indart))
dev.off()

emmeans(mod.indart, pairwise ~ PLOT)
emmeans(mod.indart, pairwise ~ ENCLOSURE)

## diversity
mod.ordiv <- glmmTMB(ordiv ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                      data=art2)

Anova(mod.ordiv, type=2)
summary(mod.ordiv)

round(summary(mod.ordiv)$coefficients$cond[-1,1]/(summary(mod.ordiv)$coefficients$cond[-1,2]*sqrt(72)),2)

emmeans(mod.ordiv, pairwise ~ PLOT)

emmeans(mod.ordiv, pairwise ~ ENCLOSURE)

# 
setEPS()
postscript("mod.ordiv.eps", width=3, height=3)
plot(allEffects(mod.ordiv))
dev.off()

################# multivariate#######
mod.ordinimat <- cca(ordinimat)

vare.cca <- cca(ordinimat ~ PLOT * ENCLOSURE, ordinimatcov)
vare.cca
summary(vare.cca)
scores(vare.cca)$species

anova(vare.cca, by="terms")
anova(vare.cca, by="axis")

setEPS()
postscript("cca.eps", width=6, height=6)
plot(vare.cca, display = c("species", "bp"))
dev.off()

spenvcor(vare.cca)
goodness(vare.cca, summarize = TRUE)

####################################
### tests for single groups
### 
colSums(ordinimat)
mod.coleopt <- glmmTMB(Coleoptera ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                       data=art2,
                       family = nbinom1,
                       ziformula = ~1)
summary(mod.coleopt)

setEPS()
postscript("coleopt.eps", width=3, height=3)
plot(allEffects(mod.coleopt))
dev.off()

### 
mod.araneae <- glmmTMB(Araneae ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                       data=art2,
                       family = nbinom1,
                       ziformula = ~1)

summary(mod.araneae)

setEPS()
postscript("araneae.eps", width=3, height=3)
plot(allEffects(mod.araneae))
dev.off()

### 
mod.diplop <- glmmTMB(Diplopoda ~ PLOT* ENCLOSURE + (1|SITE/BLOCK),
                       data=art2,
                       family = nbinom2,
                      ziformula = ~1)
summary(mod.diplop)

setEPS()
postscript("diplop.eps", width=3, height=3)
plot(allEffects(mod.diplop))
dev.off()

###
mod.diptera <- glmmTMB(Diptera ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                      data=art2,
                      family = nbinom2,
                      ziformula = ~1)
summary(mod.diptera)

setEPS()
postscript("diptera.eps", width=3, height=3)
plot(allEffects(mod.diptera))
dev.off()

### 
mod.hemipt <- glmmTMB(Hemiptera ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                      data=art2,
                      family = nbinom1,
                      ziformula = ~1)
summary(mod.hemipt)

setEPS()
postscript("hemipt.eps", width=3, height=3)
plot(allEffects(mod.hemipt))
dev.off()

### 
mod.hymenop <- glmmTMB(Hymenoptera ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                      data=art2,
                      family = nbinom2,
                      ziformula = ~1)
summary(mod.hymenop)

setEPS()
postscript("hymenop.eps", width=3, height=3)
plot(allEffects(mod.hymenop))
dev.off()

### 
mod.lepid <- glmmTMB(Lepidoptera ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                       data=art2,
                       family = nbinom2,
                       ziformula = ~1)
summary(mod.lepid)

setEPS()
postscript("lepid.eps", width=3, height=3)
plot(allEffects(mod.lepid))
dev.off()

### 
mod.opilio <- glmmTMB(Opiliones ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                     data=art2,
                     family = nbinom1,
                     ziformula = ~1)
summary(mod.opilio)

setEPS()
postscript("opilio.eps", width=3, height=3)
plot(allEffects(mod.opilio))
dev.off()

### 
mod.orthop <- glmmTMB(Orthoptera ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                      data=art2,
                      family = nbinom1,
                      ziformula = ~1)
summary(mod.orthop)

setEPS()
postscript("orthop.eps", width=3, height=3)
plot(allEffects(mod.orthop))
dev.off()

### 
mod.polyd <- glmmTMB(Polydesmida ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                      data=art2,
                      family = nbinom2,
                     ziformula = ~1)
summary(mod.polyd)

setEPS()
postscript("polyd.eps", width=3, height=3)
plot(allEffects(mod.polyd))
dev.off()

### 
mod.thysa <- glmmTMB(Thysanura ~ PLOT* ENCLOSURE + (1|SITE/BLOCK/rep),
                     data=art2,
                     family = nbinom1,
                     ziformula = ~1)
summary(mod.thysa)

setEPS()
postscript("thysa.eps", width=3, height=3)
plot(allEffects(mod.thysa))
dev.off()

##### multivariate 
### nmds

ordinimat0 <- as.matrix(art2[,13:34])
colSums(ordinimat0)
rowSums(ordinimat0)
ordinimat <- ordinimat[which(rowSums(ordinimat0)>1),]

# meta mds with vegan
mod.ordinimat <- metaMDS(ordinimat, k = 2)

stressplot(mod.ordinimat)

summary(mod.ordinimat)

#######
#extract NMDS scores (x and y coordinates) for sites from newer versions of vegan package
data.scores = as.data.frame(scores(mod.ordinimat)$sites)

#add columns to data frame 
data.scores$Grazing = art2[which(rowSums(ordinimat0)>1),]$ENCLOSURE
data.scores$Shrub = art2[which(rowSums(ordinimat0)>1),]$PLOT

#####
pdf('nmds1.pdf', 5, 5)
stressplot(mod.ordinimat)
dev.off()

pdf('nmds2.pdf', 6, 6)
ordiplot(mod.ordinimat,type="n")
#points(mod.ordinimat, disp="sites", pch=16, col="green", bg="green", cex=0.4)
ordispider(mod.ordinimat, ordinimatcov$treatm, col=1:6, label = F) 
orditorp(mod.ordinimat,display="species",col="red",air=0.1)
dev.off()


##
xx = ggplot(data.scores, aes(x = NMDS1, y = NMDS2)) + 
  geom_point(size = 2, aes(shape = Grazing, colour = Shrub))+ 
  theme(axis.text.y = element_text(colour = "black", size = 12, face = "bold"), 
        axis.text.x = element_text(colour = "black", face = "bold", size = 12), 
        legend.text = element_text(size = 12, face ="bold", colour ="black"), 
        legend.position = "right", axis.title.y = element_text(face = "bold", size = 14), 
        axis.title.x = element_text(face = "bold", size = 14, colour = "black"), 
        legend.title = element_text(size = 14, colour = "black", face = "bold"), 
        panel.background = element_blank(), panel.border = element_rect(colour = "black", fill = NA, size = 1.2),
        legend.key=element_blank()) + 
  labs(x = "NMDS1", colour = "Grazing", y = "NMDS2", shape = "Shrub")  + 
  scale_colour_manual(values = c("#009E73", "#E69F00")) 

xx

pdf('nmds3.pdf', 7, 5)
xx
dev.off()
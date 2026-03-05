#Load and understsnd the HairEyeColor Dataset
#Load dataset
data(HairEyeColor)
#Check structure
str(HairEyeColor)
View(HairEyeColor)
?HairEyeColor
#very basic mosaic plot(Base R)
mosaicplot(HairEyeColor)
#Add Titles and colors
mosaicplot(HairEyeColor, main="Mosaic plot:Hair,Eye Color and Sex",
           color=TRUE)
#Two-variable Mosaic plot
HairEye2D<-margin.table(HairEyeColor,c(1,2))
mosaicplot( HairEye2D, main="Hair vs Eye Color Mosaic Plot",
            color=TRUE)
#Mosaic plots by sex
par(mfrow=c(1,2))
mosaicplot( HairEyeColor[,,"Male"], main="Male",color=TRUE)
mosaicplot( HairEyeColor[,,"Female"], main="Female",color=TRUE)
par(mfrow=c(1,1))
#Custom colors
mosaicplot( HairEye2D, col=c("brown","black","red","yellow"),
            main="Hair vs EyeColor(Custom)")
#Advanced Mosaic Plot using 'vcd'
install.packages("vcd")
library(vcd)
mosaic( HairEyeColor,shade=TRUE,legend=TRUE,
        main="Shaded Mosaic Plot(vcd)")
#Convert Dataset to Data Frame(For ggplot)
hair_eye_df<-as.data.frame(HairEyeColor)
head(hair_eye_df)
#ggplot Alternative(Proportional Mosaic-Style Plot)
library(ggplot2)
ggplot(hair_eye_df,aes(x=Hair,y=Freq,fill=Eye))+
  geom_bar(stat="identity",position="fill")+
  facet_wrap(~Sex)+
  labs(
    title="Proportional Distribution of Eye Color by Hair",
  y="Proportion"
  )+
  theme_minimal()
#Advanced Mosaic with Residual Shading
mosaic(~Hair+Eye+Sex, data=hair_eye_df,shade=TRUE,legend=TRUE)

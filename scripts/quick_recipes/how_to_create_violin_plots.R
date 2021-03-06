# My session information for result reproducibility
# > sessionInfo()
# R version 3.4.2 (2017-09-28)
# Platform: x86_64-w64-mingw32/x64 (64-bit)
# Running under: Windows 7 x64 (build 7601) Service Pack 1


# Before plotting the data, please do the following steps;
# Step 1: Rename the column names as I have done. Please see the attached data file.
# Optional Step: Save the data file in csv format. You can also use the default excel file, there is no problem in it. This is only a matter of choice.

# Step 2: read the data in R environment
box_data<- read.csv("C:/Users/ashish.dutt/Downloads/Box.csv", sep = ",",
                    header = TRUE)
str(box_data)

# Step 3: Plot the variables

# Example-1: Converting a numeric variable to factor and then plotting it
p <- ggplot(box_data, aes(factor(lessthan40), lessthan20))+
  geom_violin()
p

# Example-2: Plotting numeric variable only
p <- ggplot(box_data, aes(x=lessthan20, y=lessthan60))+
  geom_violin(trim=FALSE)
p

# Example-3
# choose data within a specific limit to display
range(box_data$lessthan60)
p+scale_x_discrete(limits=c("100","300"))

# Example-4
# add summary statistics on a violin plot
# add mean and median points
# violin plot with mean points
p + stat_summary(fun.y=mean, geom="point", shape=23, size=2)
# violin plot with median points
p + stat_summary(fun.y=median, geom="point", size=2, color="red")

# Example-5
# add median and quartile, use geom_boxplot
p + geom_boxplot(width=0.1)

# Example-6
# Add mean and standard deviation
# The function mean_sdl is used. mean_sdl computes the mean plus or minus a constant times the standard deviation.
require(Hmisc)
p + stat_summary(fun.data="mean_sdl", geom="crossbar", width=0.2 )
p + stat_summary(fun.data=mean_sdl, geom="pointrange", color="red")

# Example-7
# Violin plot with dots
# Dots (or points) can be added to a violin plot using the functions geom_dotplot() or geom_jitter()
# violin plot with dot plot
p + geom_dotplot(binaxis='y', stackdir='center', dotsize=1, binwidth = 30)
# violin plot with jittered points
# 0.2 : degree of jitter in x direction
p + geom_jitter(shape=16, position=position_jitter(0.2))

# Example-8: Color effects
p + scale_color_grey() + theme_classic()
# Use brewer color palettes
p+scale_color_brewer(palette="Dark2")

# Use single color
p <- ggplot(box_data, aes(x=lessthan20, y=lessthan60))+
  geom_violin(trim=FALSE,fill='#A4A4A4', color="darkred")+
  theme_minimal()
p # show the plot

# End of Script
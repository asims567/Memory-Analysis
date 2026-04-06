memory <- data.frame(
  Score = c(70,82,90,92,85,88,70,85,65,78,71,74,85,70,65,64,63,75,55,72),
  Group = factor(c(
    rep("Negative", 6),
    rep("Positive", 8), 
    rep("Neutral", 6)
  ))
)   

anova_result <- aov(Score ~ Group, data = memory)
summary(anova_result)

> summary(anova_result)
            Df Sum Sq Mean Sq F value
Group        2 1064.6   532.3   9.603
Residuals   17  942.3    55.4        
             Pr(>F)   
Group       0.00162 **
Residuals             
---
Signif. codes:  
  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1
  ‘ ’ 1


library(ggpubr)
library(ggplot2)

ggboxplot(memory, x = "Group", y = "Score", 
          color = "Group", palette = "jco",
          add = "jitter") + 
  stat_compare_means(method = "anova")
  labs(title = "Memory Recall Scores by Picture Type", 
       x = "Picture Type", 
       y = "Recall Score (%)") +
    theme_classic()


library(ggplot2)

ggplot(memory, aes(x = Group, y = Score)) +
  stat_summary(fun = mean, geom = "bar", fill = "skyblue") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  labs(title = "Mean Memory Scores by Group",
        y = "Mean Recall Score") +
  theme_classic()


summary(memory)
Score            Group  
 Min.   :55.00   Negative:6  
 1st Qu.:68.75   Neutral :6  
 Median :73.00   Positive:8  
 Mean   :74.95               
 3rd Qu.:85.00               
 Max.   :92.00 
  

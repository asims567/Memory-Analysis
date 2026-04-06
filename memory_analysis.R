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
  
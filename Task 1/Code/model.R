diabete <- read.csv("C:\\Users\\USER\\Desktop\\Diabete_Project\\diabete.csv")

data_men <- subset(diabete, HSSEX == 1) # 假设HSSEX为1代表男性
data_women <- subset(diabete, HSSEX == 2) # 假设HSSEX为2代表女性


# height, model1, men
model_men <- glm(BF ~ BMPHT_zscore + HSAGEIR, data = data_men)
summary(model_men)
confint(model_men, level = 0.95)

# height, model1, women
model_women <- glm(BF ~ BMPHT_zscore + HSAGEIR, data = data_women)
summary(model_women)
confint(model_women, level = 0.95)

# height, model2, men
model2_men <- lm(BF ~ BMPHT_zscore + HSAGEIR + parental_diabetes + Activity_Level +
                   education + income + smoke, data = data_men)
summary(model2_men)
confint(model2_men, level = 0.95)

# height, model2, women
model2_women <- lm(BF ~ BMPHT_zscore + HSAGEIR + parental_diabetes + Activity_Level +
                   education + income + smoke, data = data_women)
summary(model2_women)
confint(model2_women, level = 0.95)

# leg length, model1, men
leg_len_men <- lm(BF ~ leg_length_zscore + HSAGEIR, data = data_men)
summary(leg_len_men)
confint(leg_len_men, level = 0.95)

# leg length, model1, women
leg_len_women <- lm(BF ~ leg_length_zscore + HSAGEIR, data = data_women)
summary(leg_len_women)
confint(leg_len_women, level = 0.95)

# leg length, model2, men
leg_len2_men <- lm(BF ~ leg_length_zscore + HSAGEIR + parental_diabetes + 
                     Activity_Level + education + income + smoke, data = data_men)
summary(leg_len2_men)
confint(leg_len2_men, level = 0.95)

# leg length, model2, women
leg_len2_women <- lm(BF ~ leg_length_zscore + HSAGEIR + parental_diabetes + 
                     Activity_Level + education + income + smoke, data = data_women)
summary(leg_len2_women)
confint(leg_len2_women, level = 0.95)

# Leg length–to–height ratio, model1, men
ratio_men <- lm(BF ~ leg_length_ratio_zscore + HSAGEIR, data = data_men)
summary(ratio_men)
confint(ratio_men, level = 0.95)

# Leg length–to–height ratio, model1, women
ratio_women <- lm(BF ~ leg_length_ratio_zscore + HSAGEIR, data = data_women)
summary(ratio_women)
confint(ratio_women, level = 0.95)

# Leg length–to–height ratio, model2, men
ratio2_men <- lm(BF ~ leg_length_ratio_zscore + HSAGEIR + parental_diabetes + 
                  Activity_Level + education + income + smoke, data = data_men)
summary(ratio2_men)
confint(ratio2_men, level = 0.95)

# Leg length–to–height ratio, model2, women
ratio2_women <- lm(BF ~ leg_length_ratio_zscore + HSAGEIR + parental_diabetes + 
                    Activity_Level + education + income + smoke, data = data_women)
summary(ratio2_women)
confint(ratio2_women, level = 0.95)

# HOMA-IR, height, model1
model_homa <- lm(log(HOMA2_IR) ~ BMPHT_zscore + HSAGEIR, data = diabete)

coefficients_exp <- exp(coef(model_homa))
coefficients_exp
confint_exp <- exp(confint(model_homa, level = 0.95))
confint_exp

# HOMA-IR, height, model2
model2_homa <- lm(log(HOMA2_IR) ~ BMPHT_zscore + HSAGEIR + parental_diabetes + 
                   Activity_Level + education + income + smoke, data = diabete)
coefficients_exp <- exp(coef(model2_homa))
coefficients_exp
confint_exp <- exp(confint(model2_homa, level = 0.95))
confint_exp

# HOMA-IR, height, model3
model3_homa <- lm(log(HOMA2_IR) ~ BMPHT_zscore + HSAGEIR + parental_diabetes + 
                    Activity_Level + education + income + smoke + BF + BF*HSSEX, data = diabete)
coefficients_exp <- exp(coef(model3_homa))
coefficients_exp
confint_exp <- exp(confint(model3_homa, level = 0.95))
confint_exp
summary(model3_homa)

# HOMA-IR, leg length, model1
model_homa_leg_length <- lm(log(HOMA2_IR) ~ leg_length_zscore + HSAGEIR, data = diabete)
coefficients_exp <- exp(coef(model_homa_leg_length))
coefficients_exp
confint_exp <- exp(confint(model_homa_leg_length, level = 0.95))
confint_exp
summary(model_homa_leg_length)

# HOMA-IR, leg length, model2
model2_homa_leg_length <- lm(log(HOMA2_IR) ~ leg_length_zscore + HSAGEIR + parental_diabetes + 
                    Activity_Level + education + income + smoke, data = diabete)
coefficients_exp <- exp(coef(model2_homa_leg_length))
coefficients_exp
confint_exp <- exp(confint(model2_homa_leg_length, level = 0.95))
confint_exp
summary(model2_homa_leg_length)

# HOMA-IR, leg length, model3
model3_homa_leg_length <- lm(log(HOMA2_IR) ~ leg_length_zscore + HSAGEIR + parental_diabetes + 
                    Activity_Level + education + income + smoke + BF + BF*HSSEX, data = diabete)
coefficients_exp <- exp(coef(model3_homa_leg_length))
coefficients_exp
confint_exp <- exp(confint(model3_homa_leg_length, level = 0.95))
confint_exp
summary(model3_homa_leg_length)

# HOMA-IR, Leg length–to–height ratio, model1
model_homa_ratio <- lm(log(HOMA2_IR) ~ leg_length_ratio_zscore + HSAGEIR, data = diabete)
coefficients_exp <- exp(coef(model_homa_ratio))
coefficients_exp
confint_exp <- exp(confint(model_homa_ratio, level = 0.95))
confint_exp
summary(model_homa_ratio)

# HOMA-IR, Leg length–to–height ratio, model2
model2_homa_ratio <- lm(log(HOMA2_IR) ~ leg_length_ratio_zscore + HSAGEIR + parental_diabetes + 
                               Activity_Level + education + income + smoke, data = diabete)
coefficients_exp <- exp(coef(model2_homa_ratio))
coefficients_exp
confint_exp <- exp(confint(model2_homa_ratio, level = 0.95))
confint_exp
summary(model2_homa_ratio)

# HOMA-IR, Leg length–to–height ratio, model3
model3_homa_ratio <- lm(log(HOMA2_IR) ~ leg_length_ratio_zscore + HSAGEIR + parental_diabetes + 
                               Activity_Level + education + income + smoke + BF + BF*HSSEX, data = diabete)
coefficients_exp <- exp(coef(model3_homa_ratio))
coefficients_exp
confint_exp <- exp(confint(model3_homa_ratio, level = 0.95))
confint_exp
summary(model3_homa_ratio)

# OGTT
library(nnet)

# Calculate PR and 95% CI
calculate_PR_CI <- function(beta, SE) {
  PR <- exp(beta)
  CI <- exp(c(beta - 1.96 * SE, beta + 1.96 * SE))
  return(list(PR = PR, CI = CI))
}

# Height    
# Model 1, Height%*
model1_OGTT <- multinom(OGTT_Class ~ BMPHT_zscore + HSAGEIR, data = diabete)
summary(model1_OGTT)
summary_model1 <- summary(model1_OGTT)
coef_model1 <- summary_model1$coefficients
se_model1 <- summary_model1$standard.errors
 
# z score
z_values <- coef_model1 / se_model1

# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model1_D <- calculate_PR_CI(coef_model1["D", "BMPHT_zscore"], se_model1["D", "BMPHT_zscore"])
PR_CI_model1_I <- calculate_PR_CI(coef_model1["I", "BMPHT_zscore"], se_model1["I", "BMPHT_zscore"])
print("Model 1 - Diabetes Prevalence Ratio: ")
PR_CI_model1_D
print("Model 1 - IGT Prevalence Ratio: ")
PR_CI_model1_I



# Model 2, Height
model2_OGTT <- multinom(OGTT_Class ~ BMPHT_zscore + HSAGEIR + parental_diabetes 
                   + Activity_Level + education + income + smoke, data= diabete)
summary(model2_OGTT)
summary_model2 <- summary(model2_OGTT)
coef_model2 <- summary_model2$coefficients
se_model2 <- summary_model2$standard.errors

# z score
z_values <- coef_model2 / se_model2

# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model2_D <- calculate_PR_CI(coef_model2["D", "BMPHT_zscore"], se_model2["D", "BMPHT_zscore"])
PR_CI_model2_I <- calculate_PR_CI(coef_model2["I", "BMPHT_zscore"], se_model2["I", "BMPHT_zscore"])
print("Model 2 - Diabetes Prevalence Ratio: ")
PR_CI_model2_D
print("Model 2 - IGT Prevalence Ratio: ")
PR_CI_model2_I

# Model 3, Height
model3_OGTT <- multinom(OGTT_Class ~ BMPHT_zscore + HSAGEIR + parental_diabetes 
                   + Activity_Level + education + income + smoke + BF + BF*HSSEX, data = diabete)
summary_model <- summary(model3_OGTT)
coef_model <- summary_model$coefficients
se_model <- summary_model$standard.errors

# z score
z_values <- coef_model / se_model

# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model_D <- calculate_PR_CI(coef_model["D", "BMPHT_zscore"], se_model["D", "BMPHT_zscore"])
PR_CI_model_I <- calculate_PR_CI(coef_model["I", "BMPHT_zscore"], se_model["I", "BMPHT_zscore"])
print("Diabetes Prevalence Ratio: ")
PR_CI_model_D
print("IGT Prevalence Ratio: ")
PR_CI_model_I

# Leg Length
# Model 1, leg length
model1_OGTT <- multinom(OGTT_Class ~ leg_length_zscore + HSAGEIR, data = diabete)
summary_model <- summary(model1_OGTT)
coef_model <- summary_model$coefficients
se_model <- summary_model$standard.errors
 
# z score
z_values <- coef_model1 / se_model1
summary(model1_OGTT)
# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model_D <- calculate_PR_CI(coef_model["D", "leg_length_zscore"], se_model["D", "leg_length_zscore"])
PR_CI_model_I <- calculate_PR_CI(coef_model["I", "leg_length_zscore"], se_model["I", "leg_length_zscore"])
print("Diabetes Prevalence Ratio: ")
PR_CI_model_D
print("IGT Prevalence Ratio: ")
PR_CI_model_I



# Model 2, leg length
model2_OGTT <- multinom(OGTT_Class ~ leg_length_zscore + HSAGEIR + parental_diabetes 
                   + Activity_Level + education + income + smoke, data= diabete)
summary_model2 <- summary(model2_OGTT)
coef_model <- summary_model2$coefficients
se_model <- summary_model2$standard.errors

# z score
z_values <- coef_model / se_model

# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model_D <- calculate_PR_CI(coef_model["D", "leg_length_zscore"], se_model["D", "leg_length_zscore"])
PR_CI_model_I <- calculate_PR_CI(coef_model["I", "leg_length_zscore"], se_model["I", "leg_length_zscore"])
print("Diabetes Prevalence Ratio: ")
PR_CI_model_D
print("IGT Prevalence Ratio: ")
PR_CI_model_I

# Model 3, leg length
model3_OGTT <- multinom(OGTT_Class ~ leg_length_zscore + HSAGEIR + parental_diabetes 
                   + Activity_Level + education + income + smoke + BF + BF*HSSEX, data = diabete)
summary_model <- summary(model3_OGTT)
coef_model <- summary_model$coefficients
se_model <- summary_model$standard.errors

# z score
z_values <- coef_model / se_model

# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model_D <- calculate_PR_CI(coef_model["D", "leg_length_zscore"], se_model["D", "leg_length_zscore"])
PR_CI_model_I <- calculate_PR_CI(coef_model["I", "leg_length_zscore"], se_model["I", "leg_length_zscore"])
print("Diabetes Prevalence Ratio: ")
PR_CI_model_D
print("IGT Prevalence Ratio: ")
PR_CI_model_I

# Leg Length-to-Height Ratio
# Model 1, leg length-to-height ratio
model1_OGTT <- multinom(OGTT_Class ~ leg_length_ratio_zscore + HSAGEIR, data = diabete)
summary_model <- summary(model1_OGTT)
coef_model <- summary_model$coefficients
se_model <- summary_model$standard.errors

# z score
z_values <- coef_model / se_model

# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model_D <- calculate_PR_CI(coef_model["D", "leg_length_ratio_zscore"], se_model["D", "leg_length_ratio_zscore"])
PR_CI_model_I <- calculate_PR_CI(coef_model["I", "leg_length_ratio_zscore"], se_model["I", "leg_length_ratio_zscore"])
print("Diabetes Prevalence Ratio: ")
PR_CI_model_D
print("IGT Prevalence Ratio: ")
PR_CI_model_I



# Model 2, leg length-to-height ratio
model2_OGTT <- multinom(OGTT_Class ~ leg_length_ratio_zscore + HSAGEIR + parental_diabetes 
                        + Activity_Level + education + income + smoke, data= diabete)
summary_model2 <- summary(model2_OGTT)
coef_model <- summary_model2$coefficients
se_model <- summary_model2$standard.errors

# z score
z_values <- coef_model / se_model

# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model_D <- calculate_PR_CI(coef_model["D", "leg_length_ratio_zscore"], se_model["D", "leg_length_ratio_zscore"])
PR_CI_model_I <- calculate_PR_CI(coef_model["I", "leg_length_ratio_zscore"], se_model["I", "leg_length_ratio_zscore"])
print("Diabetes Prevalence Ratio: ")
PR_CI_model_D
print("IGT Prevalence Ratio: ")
PR_CI_model_I

# Model 3, leg length-to-height ratio
model3_OGTT <- multinom(OGTT_Class ~ leg_length_ratio_zscore + HSAGEIR + parental_diabetes 
                        + Activity_Level + education + income + smoke + BF + BF*HSSEX, data = diabete)
summary_model <- summary(model3_OGTT)
coef_model <- summary_model$coefficients
se_model <- summary_model$standard.errors

# z score
z_values <- coef_model / se_model

# p-values
p_values <- 2 * pnorm(-abs(z_values))
print(p_values)

# calculate PR and CI
PR_CI_model_D <- calculate_PR_CI(coef_model["D", "leg_length_ratio_zscore"], se_model["D", "leg_length_ratio_zscore"])
PR_CI_model_I <- calculate_PR_CI(coef_model["I", "leg_length_ratio_zscore"], se_model["I", "leg_length_ratio_zscore"])
print("Diabetes Prevalence Ratio: ")
PR_CI_model_D
print("IGT Prevalence Ratio: ")
PR_CI_model_I

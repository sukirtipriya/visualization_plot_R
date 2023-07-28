##################################################################

head(as.data.frame(UCBAdmissions), n = 12)

is_alluvia_form(as.data.frame(UCBAdmissions), axes = 1:3, silent = TRUE)

ggplot(as.data.frame(UCBAdmissions),
       aes(y = Freq, axis1 = Gender, axis2 = Dept)) +
  geom_alluvium(aes(fill = Admit), width = 1/12) +
  geom_stratum(width = 1/12, fill = "black", color = "grey") +
  geom_label(stat = "stratum", aes(label = after_stat(stratum))) +
  scale_x_discrete(limits = c("Gender", "Dept"), expand = c(.05, .05)) +
  scale_fill_brewer(type = "qual", palette = "Set1") +
  ggtitle("UC Berkeley admissions and rejections, by sex and department")

################################################################
  
ggplot(as.data.frame(HairEyeColor), aes(y = Freq,
           axis1 = Hair, axis2 = Eye, axis3 = Sex)) +
  geom_alluvium(aes(fill = Eye),
                width = 1/8, knot.pos = 0, reverse = FALSE) +
  scale_fill_manual(values = c(Brown = "#70493D", Hazel = "#E2AC76",
                               Green = "#3F752B", Blue = "#81B0E4")) +
  guides(fill = "none") +
  geom_stratum(alpha = .25, width = 1/8, reverse = FALSE) +
  geom_text(stat = "stratum", aes(label = after_stat(stratum)),
            reverse = FALSE) +
  scale_x_continuous(breaks = 1:3, labels = c("Hair", "Eye", "Sex")) +
  coord_flip() +
  ggtitle("Eye colors of 592 subjects, by sex and hair color")



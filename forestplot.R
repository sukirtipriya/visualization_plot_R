model.FE4 <- meta.MH(totemploy, totunemploy, employbfed, unemploybfed, names=Studies, 
                     data= employmentcomplete)

tabletext<-cbind(c("","Studies", model.FE4$names,NA,"Summary"),
                 c("Breastfeed","(G.Employed)", employmentcomplete$employbfed, NA, NA),
                 c("Breastfeed","(NG.Employed)", employmentcomplete$unemploybfed, NA, NA),
                 c("","OR", format(exp(model.FE4$logOR),digits=2),NA,
                   format(exp(model.FE4$logMH),digits=2)),
                 c( NA,NA,format(exp(model.FE4$logOR-model.FE4$selogOR*2),digits=2), NA, 
                    format(exp(model.FE4$logMH-model.FE4$selogMH*2), digits=2 )),
                 c("95% CI", NA, format(exp(model.FE4$logOR+model.FE4$selogOR*2), digits=2), NA, 
                   format(exp(model.FE4$logMH+model.FE4$selogMH*2), digits=2)))

m<- c(NA,NA,model.FE4$logOR,NA,model.FE4$logMH)
l<- m-c(NA,NA,model.FE4$selogOR,NA,model.FE4$selogMH)*2
u<- m+c(NA,NA,model.FE4$selogOR,NA,model.FE4$selogMH)*2

forestplot(tabletext, m, l, u, zero=0,is.summary=c(TRUE,TRUE, rep(FALSE, 6),TRUE), colgap=unit(12,"mm"), clip=c(log(0.05),log(3.5)), xlog = TRUE, boxsize = 0.5, xlab = "Non-exclusive   Exclusive", col=meta.colors(box="black",line="black", summary="blue"))

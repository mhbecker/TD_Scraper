###This works and is active###
library(taskscheduleR)

#######TheDonald_Scrape######
##How to stop and delete this##
taskscheduler_stop("Daily_TD_Web_Scraping_AM")
taskscheduler_stop("Daily_TD_Web_Scraping_PM")
taskscheduler_delete("Daily_TD_Web_Scraping_AM")
taskscheduler_delete("Daily_TD_Web_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_TD_Web_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_The_Donald.r",
        schedule = "DAILY",
        starttime = "06:00",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_TD_Web_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_The_Donald.r",
        schedule = "DAILY",
        starttime = "18:00",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

#########R_Conservative############
taskscheduler_stop("Daily_RConservative_Web_Scraping_AM")
taskscheduler_stop("Daily_RConservative_Web_Scraping_PM")
taskscheduler_delete("Daily_RConservative_Web_Scraping_AM")
taskscheduler_delete("Daily_RConservative_Web_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_RConservative_Web_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_Conservative.r",
        schedule = "DAILY",
        starttime = "06:00",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_RConservative_Web_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_Conservative.r",
        schedule = "DAILY",
        starttime = "18:00",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

#########R_Democrats############
taskscheduler_stop("Daily_RDemocrats_Web_Scraping_AM")
taskscheduler_stop("Daily_RDemocrats_Web_Scraping_PM")
taskscheduler_delete("Daily_RDemocrats_Web_Scraping_AM")
taskscheduler_delete("Daily_RDemocrats_Web_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_RDemocrats_Web_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_Democrats.r",
        schedule = "DAILY",
        starttime = "06:02",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_RDemocrats_Web_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_Democrats.r",
        schedule = "DAILY",
        starttime = "18:02",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

#########R_DemSocialists############
taskscheduler_stop("Daily_R_DemSocialists_Web_Scraping_AM")
taskscheduler_stop("Daily_R_DemSocialists_Web_Scraping_PM")
taskscheduler_delete("Daily_R_DemSocialists_Web_Scraping_AM")
taskscheduler_delete("Daily_R_DemSocialists_Web_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_R_DemSocialists_Web_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_DSA.r",
        schedule = "DAILY",
        starttime = "06:04",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_R_DemSocialists_Web_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_DSA.r",
        schedule = "DAILY",
        starttime = "18:04",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)


#########R_Donald_Trump############
taskscheduler_stop("Daily_R_Donald_Trump_Web_Scraping_AM")
taskscheduler_stop("Daily_R_Donald_Trump_Web_Scraping_PM")
taskscheduler_delete("Daily_R_Donald_Trump_Web_Scraping_AM")
taskscheduler_delete("Daily_R_Donald_Trump_Web_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_R_Donald_Trump_Web_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_Donald_Trump.r",
        schedule = "DAILY",
        starttime = "06:06",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_R_Donald_Trump_Web_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_Donald_Trump.r",
        schedule = "DAILY",
        starttime = "18:06",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)



#########R_JoeBiden############
taskscheduler_stop("Daily_R_JoeBiden_Web_Scraping_AM")
taskscheduler_stop("Daily_R_JoeBiden_Web_Scraping_PM")
taskscheduler_delete("Daily_R_JoeBiden_Web_Scraping_AM")
taskscheduler_delete("Daily_R_JoeBiden_Web_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_R_JoeBiden_Web_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_JoeBiden.r",
        schedule = "DAILY",
        starttime = "06:08",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_R_JoeBiden_Web_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_JoeBiden.r",
        schedule = "DAILY",
        starttime = "18:08",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)



#########R_Trump############
taskscheduler_stop("Daily_R_Trump_Web_Scraping_AM")
taskscheduler_stop("Daily_R_Trump_Web_Scraping_PM")
taskscheduler_delete("Daily_R_Trump_Web_Scraping_AM")
taskscheduler_delete("Daily_R_Trump_Web_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_R_Trump_Web_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_Trump.r",
        schedule = "DAILY",
        starttime = "06:10",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_R_Trump_Web_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_R_Trump.r",
        schedule = "DAILY",
        starttime = "18:10",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)


#########R_donaldtrump############
taskscheduler_stop("Daily_R_DonaldTrump_Web_Scraping_AM")
taskscheduler_stop("Daily_R_DonaldTrump_Web_Scraping_PM")
taskscheduler_delete("Daily_R_DonaldTrump_Web_Scraping_AM")
taskscheduler_delete("Daily_R_DonaldTrump_Web_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_R_DonaldTrump_Web_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_DonaldTrump.r",
        schedule = "DAILY",
        starttime = "06:12",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_R_DonaldTrump_Web_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\Web_Scraping_DonaldTrump.r",
        schedule = "DAILY",
        starttime = "18:12",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)




#######Twitter Campaign Scrapes###############
taskscheduler_stop("Daily_Twitter_Scraping_AM")
taskscheduler_stop("Daily_Twitter_Scraping_PM")
taskscheduler_delete("Daily_Twitter_Scraping_AM")
taskscheduler_delete("Daily_Twitter_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_Twitter_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\BidenTrump_Twitter_Scrape.r",
        schedule = "DAILY",
        starttime = "06:14",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_Twitter_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\BidenTrump_Twitter_Scrape.r",
        schedule = "DAILY",
        starttime = "18:14",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

#######Twitter Campaign Scrapes with RTweet###############
taskscheduler_stop("Daily_RTweet_Twitter_Scraping_AM")
taskscheduler_stop("Daily_RTweet_Twitter_Scraping_PM")
taskscheduler_delete("Daily_RTweet_Twitter_Scraping_AM")
taskscheduler_delete("Daily_RTweet_Twitter_Scraping_PM")

taskscheduler_create(
        taskname = "Daily_RTweet_Twitter_Scraping_AM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\RTweet_BidenTrump_Twitter_Scrape.r",
        schedule = "DAILY",
        starttime = "06:16",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)

taskscheduler_create(
        taskname = "Daily_RTweet_Twitter_Scraping_PM",
        rscript = "C:\\Users\\mbecker\\Desktop\\R\\The_Donald\\RTweet_BidenTrump_Twitter_Scrape.r",
        schedule = "DAILY",
        starttime = "18:16",
        startdate = format(Sys.Date(), "%m/%d/%Y"),
        Rexe = file.path(Sys.getenv("R_HOME"), "bin", "Rscript.exe")
)



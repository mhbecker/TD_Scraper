library(tidyverse); library(rvest); library(stringr); library(rebus); library(lubridate)
getwd()
setwd("C:/Users/mbecker/Desktop/R/The_Donald")
######This part works and exports the front page#######
thedonald.win<-"http://thedonald.win"
main_page<-read_html(thedonald.win)
post_links<-main_page%>%
  html_nodes(".title")%>%
  html_attr('href')
post_links<-post_links[-1]
post_titles<-main_page%>%
  html_nodes(".title")%>%
  html_text()
RN_Remove_Pattern<-"\r\n"
post_titles<-str_trim(str_remove_all(post_titles, RN_Remove_Pattern))
post_titles<-post_titles[-1]
post_authors<-main_page%>%
  html_nodes(".author")%>%
  html_text()
main_post_score<-main_page%>%
  html_nodes(".count")%>%
  html_text()
main_post_datetime<-main_page%>%
  html_nodes(".timeago")%>%
  html_attr("title")
main_post_comment_count<-main_page%>%
  html_nodes(".original.comments")%>%
  html_text()

prefix<-"http://thedonald.win"
prefix<-rep(prefix, length(post_links))
full_post_links<-paste(prefix, post_links, sep="")
RN_Remove_Pattern<-"\r\n"
full_post_links<-str_trim(str_remove_all(full_post_links, RN_Remove_Pattern))


scrape_time<-Sys.time()
scrape_time<-rep(scrape_time, length(post_links))

##Stickied posts are always the first X posts that are "promoted" content
MOD_STICKIED_POST<-rep(0, length(post_titles))
MOD_STICKY_TAG<-main_page%>%
  html_nodes(".status")%>%
  html_text()
MOD_STICKIED_POST[1:length(MOD_STICKY_TAG)]<-1

###
Domain<-main_page%>%
  html_nodes(".domain")%>%
  html_text()
RN_Remove_Pattern<-"\r\n"
Domain<-str_trim(str_remove_all(Domain, RN_Remove_Pattern))
Domain

  
T_D<-as.data.frame(cbind(scrape_time, post_titles, MOD_STICKIED_POST, Domain, post_authors, full_post_links, main_post_comment_count, main_post_datetime, main_post_score))  

T_D$post_ID<-c(1:length(post_links))

DATE<-Sys.Date()
DATE<-str_replace_all(DATE,"-","_")
DATE

T_D$Scrape_date<-DATE

format(Sys.time(),"%p")
TIME_SUFFIX<-format(Sys.time(),"%p")
T_D$AM_PM<-TIME_SUFFIX

filename<-paste("./T_D_",DATE,"_",TIME_SUFFIX,".csv", sep="")
write.csv(T_D, file = filename)
#write.table(T_D, file = "./T_D_FrontPage_FULL.csv", append = TRUE, quote = FALSE, col.names = FALSE, row.names = FALSE)


              ###################################################################
              ###################################################################
              ###################################################################
              ###################################################################
              ###################################################################



for(i in T_D$post_ID){
  post<-T_D$full_post_links[i]
  post<-read_html(as.character(post))
  
  ##Title - this is good
  title<-post%>%
    html_nodes(".title")%>%
    html_text()
  title<-title[-1]
  RN_Remove_Pattern<-"\r\n"
  title<-str_trim(str_remove_all(title, RN_Remove_Pattern))
  
  
  
  ##Author
  OP_author<-post%>%
    html_nodes(".post")%>%
    html_attr("data-author")
  
  ##Comment DateTime
  comment_datetime<-post%>%
    html_nodes(".comment")%>%
    html_nodes(".timeago")%>%
    html_attr("title")
  RN_Remove_Pattern<-"\r\n"
  comment_datetime_deleted<-post%>%
    html_nodes(".comment.deleted")%>%
    html_nodes(".timeago")%>%
    html_attr("title")
  '%!in%'<-function(x,y)!('%in%'(x,y))
  deleted_posts<-which(comment_datetime%in%comment_datetime_deleted)
  if(length(deleted_posts)!=0){
    comment_datetime<-comment_datetime[comment_datetime%!in%comment_datetime_deleted]
  }
  
  ##OP DateTime
  OP_datetime<-post%>%
    html_nodes(".timeago")%>%
    html_attr("title")
  OP_datetime<-OP_datetime[1]
  
  
  ##Upvotes
  upvotes<-post%>%
    html_nodes(".positive")%>%
    html_text()
  comment_upvotes<-upvotes[-1]
  if(length(deleted_posts)!=0){
  comment_upvotes<-comment_upvotes[-deleted_posts]}
  OP_upvotes<-upvotes[1]
  
  ##Downvotes
  downvotes<-post%>%
    html_nodes(".negative")%>%
    html_text()
  comment_downvotes<-downvotes[-1]
  if(length(deleted_posts)!=0){
    comment_downvotes<-comment_downvotes[-deleted_posts]}
  OP_downvotes<-downvotes[1]

  ##Comment
  comments<-post%>%
    html_nodes(".comment")%>%
    html_nodes(".content")%>%
    html_text()
  RN_Remove_Pattern<-"\r\n"
  comments<-str_trim(str_remove_all(comments, RN_Remove_Pattern))
  
  ##Comment_is_Child
  comment_child<-post%>%
    html_nodes(".comment")%>%
    html_nodes(".actions")%>%
    html_text()
  RN_Remove_Pattern<-"\r\n"
  comment_child<-str_trim(str_remove_all(comment_child, RN_Remove_Pattern))
  
  Child_comment<-rep(0, length(comments))
  Child_index<-grep("^parent",comment_child)
  Child_comment[Child_index]<-1
  Child_comment[is.na(Child_comment)]<-0
  
  ###Comment authors
  comment_authors<-post%>%
    html_nodes(".comment")%>%
    html_nodes(".author")%>%
    html_text()
  RN_Remove_Pattern<-"\r\n"
  comment_authors<-str_trim(str_remove_all(comment_authors, RN_Remove_Pattern))
  comment_authors<-comment_authors[comment_authors!="deleted"]
  
  ####Grafting these together
  post_ID<-i
  post_scrape_time<-Sys.time()
  df_OP<-as.data.frame(cbind(post_ID, post_scrape_time,title, OP_author, OP_datetime, OP_upvotes, OP_downvotes))
  df_comments<-as.data.frame(cbind(comments,Child_comment,comment_authors, comment_datetime, comment_upvotes, comment_downvotes))
  
  if(i==1){
    df_post<-cbind(df_OP, df_comments)
    print(dim(df_post))
    print(i)
      }else{
    df_post_add<-cbind(df_OP, df_comments)
    print(dim(df_comments))
    print(dim(df_OP))
    df_post<-rbind(df_post,df_post_add)
    print(dim(df_post_add))
    print(dim(df_post))
    print(i)
    }

}

format(Sys.time(),"%p")
TIME_SUFFIX<-format(Sys.time(),"%p")

df_post$Scrape_date<-DATE
df_post$AM_PM<-TIME_SUFFIX

filename_comments<-paste("./T_D_comments_",DATE,"_",TIME_SUFFIX,".csv", sep="")
write.csv(df_post, file = filename_comments)
#write.csv(df_post, file = "./T_D_comments_FULL.csv", append = TRUE, quote = FALSE, col.names = FALSE, row.names = FALSE)


              ###################################################################
              ###################################################################
              ###################################################################
              ###################################################################
              ############This is an example post AND IT WORKS ##################

#post_1<-T_D$full_post_links[1]
#post_1<-read_html(as.character(post_1))
#full_post_links[1]
#read_html(full_post_links[1])
#post_1_comments<-post_1%>%
#  html_nodes(".comment")%>%
#  html_nodes(".content")%>%
#  html_text()
#RN_Remove_Pattern<-"\r\n"
#post_1_comments<-str_trim(str_remove_all(post_1_comments, RN_Remove_Pattern))

#Comment_is_Child
#comment_child<-post_1%>%
#    html_nodes(".comment")%>%
#    html_nodes(".actions")%>%
#    html_text()
#RN_Remove_Pattern<-"\r\n"
#comment_child<-str_trim(str_remove_all(comment_child, RN_Remove_Pattern))

#Child_comment<-rep(0, length(post_1_comments))
#child_index<-grep("^parent",comment_child)
#Child_comment[child_index]<-1
#Child_comment[is.na(Child_comment)]<-0

##Comment datetime is clean and good
#post_1_comment_datetime<-post_1%>%
 # html_nodes(".comment")%>%
 # html_nodes(".timeago")%>%
 # html_attr("title")
#RN_Remove_Pattern<-"\r\n"
#post_1_comment_datetime_deleted<-post_1%>%
#  html_nodes(".comment.deleted")%>%
#  html_nodes(".timeago")%>%
#  html_attr("title")
#'%!in%'<-function(x,y)!('%in%'(x,y))
##This checks which posts have been deleted and corrects the number of rows
#deleted_posts<-which(post_1_comment_datetime%in%post_1_comment_datetime_deleted)

#post_1_comment_datetime<-post_1_comment_datetime[post_1_comment_datetime%!in% post_1_comment_datetime_deleted]


##OP Title is good
#post_1_title<-post_1%>%
 # html_nodes(".title")%>%
 # html_text()
#post_1_title<-post_1_title[-1]

#RN_Remove_Pattern<-"\r\n"
#post_1_title<-str_trim(str_remove_all(post_1_title, RN_Remove_Pattern))

##OP Author is good
#post_1_author<-post_1%>%
#  html_nodes(".post")%>%
#  html_attr("data-author")

##OP DateTime is good
#post_1_datetime<-post_1%>%
#  html_nodes(".timeago")%>%
#  html_attr("title")
#post_1_datetime<-post_1_datetime[1]

##OP Upvotes is good
#post_1_upvote<-post_1%>%
#  html_nodes(".positive")%>%
#  html_text()
#post_1_comment_upvotes<-post_1_upvote[-1]
#post_1_comment_upvotes<-post_1_comment_upvotes[-deleted_posts]
#post_1_OP_upvotes<-post_1_upvote[1]

##OP Downvotes is good
#post_1_downvote<-post_1%>%
#  html_nodes(".negative")%>%
#  html_text()
#post_1_comment_downvotes<-post_1_downvote[-1]
#post_1_comment_downvotes<-post_1_comment_downvotes[-deleted_posts]
#post_1_OP_downvotes<-post_1_downvote[1]


###Comments is clean and good
#post_1_comments<-post_1%>%
#  html_nodes(".comment")%>%
#  html_nodes(".content")%>%
#  html_text()
#RN_Remove_Pattern<-"\r\n"
#post_1_comments<-str_trim(str_remove_all(post_1_comments, RN_Remove_Pattern))

###Comment authors is clean and good
#post_1_comment_authors<-post_1%>%
#  html_nodes(".comment")%>%
#  html_nodes(".author")%>%
#  html_text()
#RN_Remove_Pattern<-"\r\n"
#post_1_comment_authors<-str_trim(str_remove_all(post_1_comment_authors, RN_Remove_Pattern))
#post_1_comment_authors<-post_1_comment_authors[post_1_comment_authors!="deleted"]

#df_comments<-as.data.frame(cbind(post_1_comments,post_1_comment_authors, post_1_comment_datetime, post_1_comment_upvotes, post_1_comment_downvotes))
#df_OP<-as.data.frame(cbind(post_1_title, post_1_author, post_1_datetime, post_1_OP_upvotes, post_1_OP_downvotes))
#df_post<-cbind(df_OP, df_comments)

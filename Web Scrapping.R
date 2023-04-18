library(rvest)
library(dplyr)

link = "https://www.boxofficemojo.com/intl/?ref_=bo_nb_cso_tab"
page = read_html(link)

title = page %>% html_nodes("td.mojo-cell-wide") %>% html_text()
price = page %>% html_nodes("td.mojo-field-type-money") %>% html_text()
area = page %>% html_nodes(".mojo-truncate") %>% html_text()

moviess = data.frame(title,price,area, stringsAsFactors = FALSE)
write.csv(movies, "movies.csv")

# Exercise 2
#follow up to "set up git" 
#committed the file to version control

# Exercise 3
houseelf_data = read.csv("Data/houseelf-earlength-dna-data.csv")

# Exercise 4
houseelf_data_1 = read.csv("Data/houseelf-earlength-dna-data_1_.csv")
#I changed the name of the file and committed the changes to git in a single commit (i did it wrong the first time, so there are a few extra commits in there)

# Exercise 5
#5.1
# I created a public repository called "houseelf-analysis"

#5.2
# I connected my local repository to the github repository by pasting the 2 lines of code provided by github into 'shell'

# Exercise 6
library(stringr)
new_houseelf_data = houseelf_data_1$dnaseq

get_gc_content = function(sequence){
  #counts % of g and c in a DNA sequence
  str_to_lower(sequence)
  Gs <- str_count(sequence, "g")
  Cs <- str_count(sequence, "c")
  gc_content <- (Gs + Cs) / str_length(sequence) * 100 
  return(gc_content)
}
gc_content = get_gc_content(new_houseelf_data)

# Exercise 7
#pulled the function below from github

get_ear_length <- function(seq){
  #Determine the ear length category
  ear_lengths <- ifelse(seq > 10, "large", "small")
  return(ear_lengths)
}

earlength_class = get_ear_length(houseelf_data_1$earlength)
earlength_class

#7.4
ID = houseelf_data_1$id
houseelf_df = data.frame(ID, earlength_class, gc_content)
houseelf_df

#7.5
write.csv(houseelf_df, file = "houseelf_df.csv")


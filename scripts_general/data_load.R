# LOADING DATASETS FOR ALL STUDIES

# study 1 -----
d1_scored <- read_csv("../data/sense_spirit_study1.csv") %>%
  mutate(country = factor(country, levels = levels_country),
         site = factor(site, levels = levels_site),
         religion = factor(religion, levels = levels_religion),
         researcher = factor(researcher, levels = levels_researcher))

contrasts(d1_scored$country) <- contrasts_country
contrasts(d1_scored$site) <- contrasts_site
contrasts(d1_scored$religion) <- contrasts_religion

d1 <- read_csv("../data_byquestion/study1_byquestion.csv") %>%
  mutate(country = factor(country, levels = levels_country),
         site = factor(site, levels = levels_site),
         religion = factor(religion, levels = levels_religion),
         researcher = factor(researcher, levels = levels_researcher)) %>%
  filter(subject_id %in% d1_scored$subject_id)

contrasts(d1$country) <- contrasts_country
contrasts(d1$site) <- contrasts_site
contrasts(d1$religion) <- contrasts_religion


# study 2 -----
d2_scored <- read_csv("../data/sense_spirit_study2.csv") %>%
  mutate(country = factor(country, levels = levels_country),
         religion = factor(religion, levels = c("charismatic", "general population")))

contrasts(d2_scored$country) <- contrasts_country
contrasts(d2_scored$religion) <- contrasts_religion

d2 <- read_csv("../data_byquestion/d_spex.csv") %>%
  select(-X1) %>%
  rename(country = epi_ctry) %>%
  mutate(country = factor(country, levels = levels_country)) %>%
  filter(epi_subj %in% d2_scored$subject_id)


# study 3 -----
d3_scored <- read_csv("../data/sense_spirit_study3.csv") %>%
  mutate(country = factor(country, levels = levels_country))

contrasts(d3_scored$country) <- contrasts_country

d3 <- read_csv("../data_byquestion/packets123_data_byquestion_long.csv") %>%
  filter(packet == 1) %>%
  rename(country = ctry) %>%
  mutate(country = factor(country,
                          levels = tolower(levels_country),
                          labels = levels_country)) %>%
  filter(subj %in% d3_scored$subject_id)

contrasts(d3$country) <- contrasts_country


# study 4 -----
d4_scored <- read_csv("../data/sense_spirit_study4.csv") %>%
  mutate(country = factor(country, levels = levels_country))

contrasts(d4_scored$country) <- contrasts_country

d4 <- read_csv("../data_byquestion/study4_byquestion.csv") %>%
  select(-X1) %>%
  rename(country = p7_ctry) %>%
  mutate(country = factor(country, levels = levels_country)) %>%
  filter(p7_subj %in% d4_scored$subject_id)

contrasts(d4$country) <- contrasts_country


## HW01 - 5 questions ask about flights dataset
View(flights)
view(airlines)

library(nycflights13)
library(dplyr)
library(lubridate)

## Question 1: which airline has the most arrival delay time in total?

flights %>%
  select(carrier, arr_delay) %>%
  group_by(carrier) %>%
  summarise(total_arrival_delay = sum(arr_delay, na.rm=T)) %>%
  arrange(desc(total_arrival_delay)) %>%
  head(1) %>%
  left_join(airlines, by="carrier")

## Question 2: Which airline has the most flight distance from October to December?
flights %>%
  filter(month >= 10) %>%
  group_by(carrier) %>%
  summarise(total_flight_distance = sum(distance)) %>%
  arrange(desc(total_flight_distance)) %>%
  head(1) %>%
  left_join(airlines, by="carrier")

## Question 3: Which origin has the least average number of flights in January?
flights %>%
  filter(month == 1) %>%
  select(origin, flight) %>%
  group_by(origin) %>%
  summarise(average_flight = mean(flight, na.rm=T)) %>%
  arrange(average_flight)

## Question 4: Which origin has the Scheduled hour of the flight from 7am to 10am the most? How many are there?
flights %>%
  mutate(scheduled_hour = format(as.POSIXct(flights$time_hour), format = "%H:%M:%S")) %>%
  select(origin, scheduled_hour) %>%
  filter(scheduled_hour >= "07:00:00" & scheduled_hour <= "10:00:00") %>%
  group_by(origin) %>%
  summarise(n = n()) %>%
  arrange(-n)

## Question 5: Which destination has the most cancled flights?

flights %>%
  select(dest, dep_time) %>%
  group_by(dest) %>%
  summarise(flights_cancelled = sum(is.na(dep_time))) %>%
  arrange(desc(flights_cancelled)) %>%
  head(1)
  

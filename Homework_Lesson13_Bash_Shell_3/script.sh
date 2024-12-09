#!/bin/bash

API_KEY="f850511001e33686456c750bc00e75f8"

get_weather_data(){
    local city="$1"
    local response=$(curl -s"https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${API_KEY}&units=metric")
    echo "$response"
}

show_weather(){
    local city="$1"
    local data=$(get_weather_data "$city")

    local temp=$(echo "$data" | jq '.main.temp')
    local weather=$(echo "$data" | jq '.weather[0].description')
    local humidity=$(echo "$data" | jq '.main.humidity')
    local wind_speed=$(echo "$data" | jq '.wind.speed')

    echo "Погода в городе: $city"
    echo "Температура: $temp °C"
    echo "Состояние: $weater"
    echo "Влажность: $himidity%"
    echo "Скорость ветра: $wind.speed м/с"
}


if [ $# -eq 0 ]; then 
    echo "Использование: $0"
    exit 1
fi

show_weather "$1"

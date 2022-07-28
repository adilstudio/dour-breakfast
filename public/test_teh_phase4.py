#!/usr/bin/python3

#Test for troizaire part 4
import random
#import pandas as pd
import cgitb
cgitb.enable()

#start_response('200 OK', [('Content-Type', 'text/html')])

#Create the player class
class Player():

    def __init__(self, name, position):
        self.name = name
        self.position = position


#Create the Team class
class Team():

    def __init__(self, name, city):
        self.name = name
        self.city = city


#Create 8 teams of players with 11 players each and assign them to a team

dic_teamplay = {}
teams = []
position = ["Heal", "Tank", "DPS"]

players_nums = list(range(1, 89))

for i in range(1, 9):
    dic_teamplay[i] = []
    for j in range(1, 12):
        play = []
        random_player = random.choice(players_nums)
        player = Player("Player_" + str(random_player) + "_" + str(j),
                        position[random.randint(0, 2)])
        play.append(player.name)
        play.append(player.position)
        dic_teamplay[i].append(play)
        players_nums.remove(random_player)
    teams.append(str(i))

print(dic_teamplay)

#A First sorting for the teams play in the tournament

teams_ = teams.copy()
tournament = []

for i in range(0, len(teams)):
    for j in range(0, len(teams_)):
        if teams[i] != teams_[j]:
            tournament.append(teams[i] + "_" + teams_[j])
    teams_.remove(teams[i])

#Last random sorting for the teams play in the tournament

tournament_ = {}
i = 0

for z in range(len(tournament)):
    choix = random.choice(tournament)
    print(choix)
    tournament.remove(choix)
    i = i + 1
    tournament_[i] = choix.split("_")

print(tournament_)

#Create the games with the teams and start it to get the results
tournament_result = {}
for x, y in tournament_.items():
    a = []
    a.append(random.randint(0, 5))
    a.append(random.randint(0, 5))
    tournament_result[x] = a

print(tournament_result)

#Calculate the results stats for each team

dict1 = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0}
dict2 = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0}

dict0 = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: 0, 8: 0}

for x, y in tournament_.items():
    #kill goals
    dict1[int(y[0])] += tournament_result[x][0]
    dict1[int(y[1])] += tournament_result[x][1]
    #kill received
    dict2[int(y[0])] += tournament_result[x][1]
    dict2[int(y[1])] += tournament_result[x][0]

    #points won
    if tournament_result[x][0] == tournament_result[x][1]:
        dict0[int(y[0])] += 1
        dict0[int(y[1])] += 1
    elif tournament_result[x][0] > tournament_result[x][1]:
        dict0[int(y[0])] += 3
    else:
        dict0[int(y[1])] += 3

print("kill goals:", dict1)
print("kill received:", dict2)

print("points:", dict0)

#df = pd.DataFrame.from_dict(dict0)
#df.sort_values(ascending=False)
#print (df)

dict = sorted(dict0.items(), key=lambda kv: kv[1], reverse=True)

print("rank:", dict)

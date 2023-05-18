SELECT CASE
	WHEN Conference = 1 then 'East'
	WHEN Conference = 0 then 'West'
	ELSE 'Error'
	END AS Conference, COUNT(*) HomeTeamCount
 FROM HomeOrAway h
	JOIN TeamInfo ti
	ON h.team_abbreviation = ti.Abbreviation
		JOIN TeamLocations tl
		ON ti.[City Name] = tl.City
 WHERE home_team = 1
 GROUP BY Conference
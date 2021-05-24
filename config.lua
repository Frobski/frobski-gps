Config = {}

Config.SkeexsNotify = true --- https://github.com/Skeexs/skeexsNotify
Config.Time = 10 --- time in seconds to install the gps

Config.EmergencyVehicles = {  ---- will always have gps
  "POLICE",
  "POLICE2"
}

Config.MecanoJobs = {
  "mechanic"
}

Config.Strings = {
  ["notmecano"] = "You're not an mechanic",
  ["installing"] = "Installing GPS",
  ["installed"] = "Installed GPS",
  ["notv"] = "You're not in a vehicle",
  ["notowned"] = "This is not a player vehicle",
  ["alreadygps"] = "This vehicle already have an GPS"
}
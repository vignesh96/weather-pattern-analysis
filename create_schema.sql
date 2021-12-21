BEGIN TRANSACTION;
DROP TABLE IF EXISTS "Location";
CREATE TABLE IF NOT EXISTS "Location" (
	"AirportCode"	TEXT NOT NULL UNIQUE,
	"City"	TEXT,
	"County"	TEXT,
	"State"	TEXT,
	"Zipcode"	NUMERIC,
	"Latitude"	REAL,
	"Longitude"	REAL,
	PRIMARY KEY("AirportCode")
);
DROP TABLE IF EXISTS "Type";
CREATE TABLE IF NOT EXISTS "Type" (
	"Type_ID"	INTEGER NOT NULL UNIQUE,
	"Type"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("Type_ID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "Severity";
CREATE TABLE IF NOT EXISTS "Severity" (
	"Severity_ID"	INTEGER NOT NULL UNIQUE,
	"Severity"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("Severity_ID" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "Event";
CREATE TABLE IF NOT EXISTS "Event" (
	"Event_ID"	INTEGER NOT NULL UNIQUE,
	"Start_time"	TEXT,
	"End_time"	TEXT,
	"Type_ID"	INTEGER NOT NULL,
	"Severity_ID"	INTEGER NOT NULL,
	"AirportCode"	INTEGER NOT NULL,
	"Timezone"	TEXT,
	"mark_for_deletion"	INTEGER DEFAULT '0',
	PRIMARY KEY("Event_ID" AUTOINCREMENT),
	FOREIGN KEY("AirportCode") REFERENCES "Location"("AirportCode"),
	FOREIGN KEY("Severity_ID") REFERENCES "Severity"("Severity_ID"),
	FOREIGN KEY("Type_ID") REFERENCES "Type"("Type_ID")
);
DROP INDEX IF EXISTS "Event_Event_ID_idx";
CREATE UNIQUE INDEX IF NOT EXISTS "Event_Event_ID_idx" ON "Event" (
	"Event_ID"
);
DROP INDEX IF EXISTS "Severity_Severity_idx";
CREATE UNIQUE INDEX IF NOT EXISTS "Severity_Severity_idx" ON "Severity" (
	"Severity"
);
COMMIT;

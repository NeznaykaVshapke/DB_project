CREATE TABLE "participants" (
  "participant_id" SERIAL PRIMARY KEY,
  "full_name" VARCHAR(100),
  "birth_date" DATE,
  "rating" INTEGER
);

CREATE TABLE "positions" (
  "position_id" SERIAL PRIMARY KEY,
  "position" VARCHAR(100),
  "participant_id" INTEGER,
  CONSTRAINT "FK_positions_participant_id"
    FOREIGN KEY ("participant_id")
    REFERENCES "participants"("participant_id")
);

CREATE TABLE "food" (
  "food_id" SERIAL PRIMARY KEY,
  "title" VARCHAR(100),
  "volume" INTEGER,
  "price" INTEGER,
  "weight" INTEGER
);

CREATE TABLE "finance" (
  "finance_id" SERIAL PRIMARY KEY,
  "food_id" INTEGER,
  "participant_id" INTEGER,
  CONSTRAINT "FK_finance_food_id"
    FOREIGN KEY ("food_id")
    REFERENCES "food"("food_id")
);

CREATE TABLE "equipment" (
  "equipment_id" SERIAL PRIMARY KEY,
  "object" VARCHAR(100),
  "weight" INTEGER,
  "participant_id" INTEGER,
  CONSTRAINT "FK_equipment_participant_id"
    FOREIGN KEY ("participant_id")
    REFERENCES "participants"("participant_id")
);
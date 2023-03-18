-- CreateTable
CREATE TABLE "Widget" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),

    CONSTRAINT "Widget_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "email" STRING NOT NULL,
    "email_verified" TIMESTAMP(3),
    "phone" STRING NOT NULL,
    "birth_date" DATE NOT NULL,
    "password_salt" STRING NOT NULL,
    "password_hashed" STRING NOT NULL,
    "first_name" STRING NOT NULL,
    "last_name" STRING NOT NULL,
    "image" STRING,
    "bio" STRING,
    "website" STRING,
    "banned" BOOL NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,
    "last_login_at" TIMESTAMPTZ NOT NULL,
    "failed_login_attempts" INT4 NOT NULL,
    "role_id" STRING NOT NULL,
    "location" STRING NOT NULL,
    "location_id" STRING NOT NULL,
    "ipAddressId" STRING NOT NULL,
    "regionId" STRING,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IpAddress" (
    "id" STRING NOT NULL,
    "ip_address" STRING NOT NULL,
    "blacklisted" BOOL NOT NULL,

    CONSTRAINT "IpAddress_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transaction" (
    "id" STRING NOT NULL,
    "owner_id" STRING NOT NULL,
    "personal_note" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "transaction_date" DATE NOT NULL,
    "amount" DECIMAL NOT NULL,
    "split_cost" INT4 NOT NULL,
    "payment_method_id" STRING NOT NULL,
    "currencyId" STRING NOT NULL,
    "transactionItemId" STRING NOT NULL,
    "transactionPlaceId" STRING NOT NULL,

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionCategory" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "emoji" STRING NOT NULL,
    "transactionSubCategoryId" STRING,

    CONSTRAINT "TransactionCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionSubCategory" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "transactionId" STRING,
    "transactionPlaceId" STRING,

    CONSTRAINT "TransactionSubCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionPlace" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,
    "transactionItemId" STRING,

    CONSTRAINT "TransactionPlace_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransactionItem" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,

    CONSTRAINT "TransactionItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentMethod" (
    "id" STRING NOT NULL,
    "issuer" STRING NOT NULL,
    "name" STRING NOT NULL,
    "foreign_currency_conversion_rate" DECIMAL NOT NULL,
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "paymentMethodTypeId" STRING NOT NULL,
    "currencyId" STRING NOT NULL,

    CONSTRAINT "PaymentMethod_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PaymentMethodType" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,

    CONSTRAINT "PaymentMethodType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FlightTrip" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "owner_id" STRING NOT NULL,
    "airportId" STRING NOT NULL,
    "transactionId" STRING NOT NULL,

    CONSTRAINT "FlightTrip_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IndividualFlight" (
    "id" STRING NOT NULL,
    "trip_id" STRING NOT NULL,
    "departure_time" TIMESTAMPTZ NOT NULL,
    "arrival_time" TIMESTAMPTZ NOT NULL,
    "flight_number" STRING NOT NULL,
    "seat" STRING NOT NULL,
    "order" INT4 NOT NULL,
    "airlineId" STRING NOT NULL,
    "airportId" STRING NOT NULL,

    CONSTRAINT "IndividualFlight_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Airline" (
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "id" STRING NOT NULL,
    "airline" STRING NOT NULL,
    "territory_reg_id" STRING NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,
    "airlineAllianceId" STRING NOT NULL,

    CONSTRAINT "Airline_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AirlineAlliance" (
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "id" STRING NOT NULL,
    "alliance" STRING NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,

    CONSTRAINT "AirlineAlliance_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Accommodation" (
    "id" STRING NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL,
    "check_in" DATE NOT NULL,
    "check_out" DATE NOT NULL,
    "owner_id" STRING NOT NULL,
    "accommodationPlaceId" STRING NOT NULL,
    "accommodationTypeId" STRING NOT NULL,
    "transactionId" STRING NOT NULL,

    CONSTRAINT "Accommodation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AccommodationPlace" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "accommodationTypeId" STRING NOT NULL,
    "cityId" STRING NOT NULL,

    CONSTRAINT "AccommodationPlace_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AccommodationType" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,

    CONSTRAINT "AccommodationType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transportation" (
    "id" STRING NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL,
    "from" STRING NOT NULL,
    "to" STRING NOT NULL,
    "date" DATE NOT NULL,
    "owner_id" STRING NOT NULL,
    "transportationTypeId" STRING NOT NULL,
    "transactionId" STRING NOT NULL,

    CONSTRAINT "Transportation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TransportationType" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,

    CONSTRAINT "TransportationType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Meal" (
    "id" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "date" DATE NOT NULL,
    "owner_id" STRING NOT NULL,
    "eat_in" BOOL NOT NULL,
    "leftovers" BOOL NOT NULL,
    "delivery" BOOL NOT NULL,
    "shared_meal" BOOL NOT NULL,
    "mealPlaceId" STRING NOT NULL,
    "mealCategoryId" STRING NOT NULL,
    "transactionId" STRING NOT NULL,

    CONSTRAINT "Meal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealCategory" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "global" BOOL NOT NULL,
    "mealPlaceId" STRING,

    CONSTRAINT "MealCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealPlace" (
    "id" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "type_id" STRING NOT NULL,
    "transactionPlaceId" STRING NOT NULL,

    CONSTRAINT "MealPlace_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealPlaceType" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "global" BOOL NOT NULL,

    CONSTRAINT "MealPlaceType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Currency" (
    "created_by_id" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "global" BOOL NOT NULL,
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "ticker" STRING NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,

    CONSTRAINT "Currency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Continent" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,

    CONSTRAINT "Continent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Region" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "continent_id" STRING NOT NULL,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Territory" (
    "created_by_id" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "global" BOOL NOT NULL,
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "name_local" STRING NOT NULL,
    "name_formal" STRING NOT NULL,
    "emoji" STRING NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,
    "region_id" STRING NOT NULL,
    "languageId" STRING,

    CONSTRAINT "Territory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TerritoryType" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,

    CONSTRAINT "TerritoryType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "City" (
    "created_by_id" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "id" STRING NOT NULL,
    "name_english" STRING NOT NULL,
    "name_local" STRING NOT NULL,
    "type_id" STRING NOT NULL,
    "territory_id" STRING NOT NULL,
    "airport_id" STRING NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CityType" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,

    CONSTRAINT "CityType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Language" (
    "id" STRING NOT NULL,
    "name_english" STRING NOT NULL,
    "name_local" STRING NOT NULL,

    CONSTRAINT "Language_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Airport" (
    "created_by_id" STRING NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "flagged" BOOL NOT NULL,
    "flagged_message" STRING NOT NULL,
    "global" BOOL NOT NULL,
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "iata" STRING NOT NULL,
    "icao" STRING NOT NULL,
    "city_id" STRING NOT NULL,
    "cityId" STRING NOT NULL,

    CONSTRAINT "Airport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vaccine" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "vaccineManufacturerId" STRING NOT NULL,

    CONSTRAINT "Vaccine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Disease" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,
    "vaccineId" STRING,
    "diseaseTypeId" STRING NOT NULL,

    CONSTRAINT "Disease_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiseaseType" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,

    CONSTRAINT "DiseaseType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VaccineManufacturer" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "created_by_id" STRING NOT NULL,

    CONSTRAINT "VaccineManufacturer_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_phone_key" ON "User"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "Role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "IpAddress_ip_address_key" ON "IpAddress"("ip_address");

-- CreateIndex
CREATE UNIQUE INDEX "TransactionCategory_name_key" ON "TransactionCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "TransactionSubCategory_name_key" ON "TransactionSubCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "PaymentMethod_name_key" ON "PaymentMethod"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Continent_name_key" ON "Continent"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Territory_name_key" ON "Territory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Territory_name_local_key" ON "Territory"("name_local");

-- CreateIndex
CREATE UNIQUE INDEX "Territory_name_formal_key" ON "Territory"("name_formal");

-- CreateIndex
CREATE UNIQUE INDEX "Territory_emoji_key" ON "Territory"("emoji");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "Region"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_ipAddressId_fkey" FOREIGN KEY ("ipAddressId") REFERENCES "IpAddress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_currencyId_fkey" FOREIGN KEY ("currencyId") REFERENCES "Currency"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_transactionItemId_fkey" FOREIGN KEY ("transactionItemId") REFERENCES "TransactionItem"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_transactionPlaceId_fkey" FOREIGN KEY ("transactionPlaceId") REFERENCES "TransactionPlace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transaction" ADD CONSTRAINT "Transaction_payment_method_id_fkey" FOREIGN KEY ("payment_method_id") REFERENCES "PaymentMethod"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionCategory" ADD CONSTRAINT "TransactionCategory_transactionSubCategoryId_fkey" FOREIGN KEY ("transactionSubCategoryId") REFERENCES "TransactionSubCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionSubCategory" ADD CONSTRAINT "TransactionSubCategory_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionSubCategory" ADD CONSTRAINT "TransactionSubCategory_transactionPlaceId_fkey" FOREIGN KEY ("transactionPlaceId") REFERENCES "TransactionPlace"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionPlace" ADD CONSTRAINT "TransactionPlace_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionPlace" ADD CONSTRAINT "TransactionPlace_transactionItemId_fkey" FOREIGN KEY ("transactionItemId") REFERENCES "TransactionItem"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransactionItem" ADD CONSTRAINT "TransactionItem_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentMethod" ADD CONSTRAINT "PaymentMethod_paymentMethodTypeId_fkey" FOREIGN KEY ("paymentMethodTypeId") REFERENCES "PaymentMethodType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentMethod" ADD CONSTRAINT "PaymentMethod_currencyId_fkey" FOREIGN KEY ("currencyId") REFERENCES "Currency"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PaymentMethod" ADD CONSTRAINT "PaymentMethod_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FlightTrip" ADD CONSTRAINT "FlightTrip_airportId_fkey" FOREIGN KEY ("airportId") REFERENCES "Airport"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FlightTrip" ADD CONSTRAINT "FlightTrip_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FlightTrip" ADD CONSTRAINT "FlightTrip_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IndividualFlight" ADD CONSTRAINT "IndividualFlight_trip_id_fkey" FOREIGN KEY ("trip_id") REFERENCES "FlightTrip"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IndividualFlight" ADD CONSTRAINT "IndividualFlight_airlineId_fkey" FOREIGN KEY ("airlineId") REFERENCES "Airline"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IndividualFlight" ADD CONSTRAINT "IndividualFlight_airportId_fkey" FOREIGN KEY ("airportId") REFERENCES "Airport"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Airline" ADD CONSTRAINT "Airline_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Airline" ADD CONSTRAINT "Airline_airlineAllianceId_fkey" FOREIGN KEY ("airlineAllianceId") REFERENCES "AirlineAlliance"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Airline" ADD CONSTRAINT "Airline_territory_reg_id_fkey" FOREIGN KEY ("territory_reg_id") REFERENCES "Territory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AirlineAlliance" ADD CONSTRAINT "AirlineAlliance_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Accommodation" ADD CONSTRAINT "Accommodation_accommodationPlaceId_fkey" FOREIGN KEY ("accommodationPlaceId") REFERENCES "AccommodationPlace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Accommodation" ADD CONSTRAINT "Accommodation_accommodationTypeId_fkey" FOREIGN KEY ("accommodationTypeId") REFERENCES "AccommodationType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Accommodation" ADD CONSTRAINT "Accommodation_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Accommodation" ADD CONSTRAINT "Accommodation_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccommodationPlace" ADD CONSTRAINT "AccommodationPlace_accommodationTypeId_fkey" FOREIGN KEY ("accommodationTypeId") REFERENCES "AccommodationType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccommodationPlace" ADD CONSTRAINT "AccommodationPlace_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccommodationPlace" ADD CONSTRAINT "AccommodationPlace_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccommodationType" ADD CONSTRAINT "AccommodationType_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transportation" ADD CONSTRAINT "Transportation_transportationTypeId_fkey" FOREIGN KEY ("transportationTypeId") REFERENCES "TransportationType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transportation" ADD CONSTRAINT "Transportation_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Transportation" ADD CONSTRAINT "Transportation_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TransportationType" ADD CONSTRAINT "TransportationType_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Meal" ADD CONSTRAINT "Meal_owner_id_fkey" FOREIGN KEY ("owner_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Meal" ADD CONSTRAINT "Meal_mealPlaceId_fkey" FOREIGN KEY ("mealPlaceId") REFERENCES "MealPlace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Meal" ADD CONSTRAINT "Meal_mealCategoryId_fkey" FOREIGN KEY ("mealCategoryId") REFERENCES "MealCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Meal" ADD CONSTRAINT "Meal_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "Transaction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealCategory" ADD CONSTRAINT "MealCategory_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealCategory" ADD CONSTRAINT "MealCategory_mealPlaceId_fkey" FOREIGN KEY ("mealPlaceId") REFERENCES "MealPlace"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealPlace" ADD CONSTRAINT "MealPlace_transactionPlaceId_fkey" FOREIGN KEY ("transactionPlaceId") REFERENCES "TransactionPlace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealPlace" ADD CONSTRAINT "MealPlace_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealPlace" ADD CONSTRAINT "MealPlace_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "MealPlaceType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealPlaceType" ADD CONSTRAINT "MealPlaceType_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Currency" ADD CONSTRAINT "Currency_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Region" ADD CONSTRAINT "Region_continent_id_fkey" FOREIGN KEY ("continent_id") REFERENCES "Continent"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Territory" ADD CONSTRAINT "Territory_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Territory" ADD CONSTRAINT "Territory_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "Region"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Territory" ADD CONSTRAINT "Territory_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "Language"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_type_id_fkey" FOREIGN KEY ("type_id") REFERENCES "CityType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_territory_id_fkey" FOREIGN KEY ("territory_id") REFERENCES "Territory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Airport" ADD CONSTRAINT "Airport_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Airport" ADD CONSTRAINT "Airport_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vaccine" ADD CONSTRAINT "Vaccine_vaccineManufacturerId_fkey" FOREIGN KEY ("vaccineManufacturerId") REFERENCES "VaccineManufacturer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vaccine" ADD CONSTRAINT "Vaccine_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disease" ADD CONSTRAINT "Disease_diseaseTypeId_fkey" FOREIGN KEY ("diseaseTypeId") REFERENCES "DiseaseType"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disease" ADD CONSTRAINT "Disease_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Disease" ADD CONSTRAINT "Disease_vaccineId_fkey" FOREIGN KEY ("vaccineId") REFERENCES "Vaccine"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DiseaseType" ADD CONSTRAINT "DiseaseType_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaccineManufacturer" ADD CONSTRAINT "VaccineManufacturer_created_by_id_fkey" FOREIGN KEY ("created_by_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

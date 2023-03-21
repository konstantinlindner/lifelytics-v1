/*
  Warnings:

  - You are about to drop the column `email_verified` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `ipAddressId` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `last_login_at` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `location` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `location_id` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `password_hashed` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `password_salt` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `regionId` on the `User` table. All the data in the column will be lost.
  - Added the required column `region_id` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_ipAddressId_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_regionId_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "email_verified";
ALTER TABLE "User" DROP COLUMN "ipAddressId";
ALTER TABLE "User" DROP COLUMN "last_login_at";
ALTER TABLE "User" DROP COLUMN "location";
ALTER TABLE "User" DROP COLUMN "location_id";
ALTER TABLE "User" DROP COLUMN "password_hashed";
ALTER TABLE "User" DROP COLUMN "password_salt";
ALTER TABLE "User" DROP COLUMN "regionId";
ALTER TABLE "User" ADD COLUMN     "email_verified_at" TIMESTAMP(3);
ALTER TABLE "User" ADD COLUMN     "ip_addresses_ids" STRING[];
ALTER TABLE "User" ADD COLUMN     "region_id" STRING NOT NULL;
ALTER TABLE "User" ALTER COLUMN "phone" DROP NOT NULL;
ALTER TABLE "User" ALTER COLUMN "flagged_message" DROP NOT NULL;
ALTER TABLE "User" ALTER COLUMN "failed_login_attempts" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_ip_addresses_ids_fkey" FOREIGN KEY ("ip_addresses_ids") REFERENCES "IpAddress"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_region_id_fkey" FOREIGN KEY ("region_id") REFERENCES "Region"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_author_id_fkey";

-- DropTable
DROP TABLE "Post";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "users" (
    "user_uuid" VARCHAR(36) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(100),
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_uuid")
);

-- CreateTable
CREATE TABLE "posts" (
    "post_uuid" VARCHAR(36) NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "content" TEXT,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "author_uuid" VARCHAR(36) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,

    CONSTRAINT "posts_pkey" PRIMARY KEY ("post_uuid")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_user_uuid_key" ON "users"("user_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "posts_post_uuid_key" ON "posts"("post_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "posts_author_uuid_key" ON "posts"("author_uuid");

-- CreateIndex
CREATE INDEX "posts_author_uuid_idx" ON "posts"("author_uuid");

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_author_uuid_fkey" FOREIGN KEY ("author_uuid") REFERENCES "users"("user_uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

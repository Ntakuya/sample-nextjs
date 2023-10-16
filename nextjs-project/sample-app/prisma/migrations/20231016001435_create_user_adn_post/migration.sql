-- CreateTable
CREATE TABLE "users" (
    "user_uuid" VARCHAR(36) NOT NULL,
    "name" VARCHAR(100),
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_uuid")
);

-- CreateTable
CREATE TABLE "posts" (
    "post_uuid" VARCHAR(36) NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "content" TEXT,
    "author_uuid" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "posts_pkey" PRIMARY KEY ("post_uuid")
);

-- CreateIndex
CREATE INDEX "posts_author_uuid_idx" ON "posts"("author_uuid");

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_author_uuid_fkey" FOREIGN KEY ("author_uuid") REFERENCES "users"("user_uuid") ON DELETE SET NULL ON UPDATE CASCADE;

-- CreateTable
CREATE TABLE "User" (
    "user_uuid" VARCHAR(36) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "name" VARCHAR(100),
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("user_uuid")
);

-- CreateTable
CREATE TABLE "Post" (
    "post_uuid" VARCHAR(36) NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "content" TEXT,
    "published" BOOLEAN NOT NULL DEFAULT false,
    "author_id" VARCHAR(36) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("post_uuid")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_user_uuid_key" ON "User"("user_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Post_post_uuid_key" ON "Post"("post_uuid");

-- CreateIndex
CREATE UNIQUE INDEX "Post_author_id_key" ON "Post"("author_id");

-- CreateIndex
CREATE INDEX "Post_author_id_idx" ON "Post"("author_id");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "User"("user_uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

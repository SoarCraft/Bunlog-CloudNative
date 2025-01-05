-- CreateTable
CREATE TABLE "User" (
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "hash" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "abstract" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "posted" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostCate" (
    "id" SERIAL NOT NULL,
    "postId" INTEGER NOT NULL,
    "categoryName" TEXT NOT NULL,

    CONSTRAINT "PostCate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "name" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "Comment" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "posted" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "postId" INTEGER NOT NULL,
    "userName" TEXT NOT NULL,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Post_title_key" ON "Post"("title");

-- AddForeignKey
ALTER TABLE "PostCate" ADD CONSTRAINT "PostCate_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostCate" ADD CONSTRAINT "PostCate_categoryName_fkey" FOREIGN KEY ("categoryName") REFERENCES "Category"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userName_fkey" FOREIGN KEY ("userName") REFERENCES "User"("name") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddEntity
INSERT INTO "User" (name, email, hash) VALUES ('Aloento', 'ALOENTO@Q-AUDIO.ORG', 'zwRoqf8jknezQQqMd97U3USVmFm2/bPdPelunQZOG7s=');

INSERT INTO "Category" (name) VALUES ('PROGRAM');
INSERT INTO "Category" (name) VALUES ('FRONTEND');
INSERT INTO "Category" (name) VALUES ('WEBCODECS');

INSERT INTO "Post" (id, title, abstract, content, posted) VALUES (1, 'Video processing with WebCodecs', 'Modern web technologies provide ample ways to work with video. Media Stream API, Media Recording API, Media Source API, and WebRTC API add up to a rich tool set for recording, transferring, and playing video streams. While solving certain high-level tasks, these APIs don''t let web programmers work with individual components of a video stream such as frames and unmuxed chunks of encoded video or audio. To get low-level access to these basic components, developers have been using WebAssembly to bring video and audio codecs into the browser. But given that modern browsers already ship with a variety of codecs (which are often accelerated by hardware), repackaging them as WebAssembly seems like a waste of human and computer resources.', '{"root":{"children":[{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"WebCodecs API","type":"text","version":1}],"direction":"ltr","format":"","indent":0,"type":"link","version":1,"rel":null,"target":null,"title":null,"url":"https://w3c.github.io/webcodecs/"},{"detail":0,"format":0,"mode":"normal","style":"","text":" eliminates this inefficiency by giving programmers a way to use media components that are already present in the browser. Specifically:","type":"text","version":1}],"direction":"ltr","format":"","indent":0,"type":"paragraph","version":1},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Video and audio decoders","type":"text","version":1}],"direction":"ltr","format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Video and audio encoders","type":"text","version":1}],"direction":"ltr","format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Raw video frames","type":"text","version":1}],"direction":"ltr","format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Image decoders","type":"text","version":1}],"direction":"ltr","format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":"ltr","format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"The WebCodecs API is useful for web applications that require full control over the way media content is processed, such as video editors, video conferencing, video streaming, etc.","type":"text","version":1}],"direction":"ltr","format":"start","indent":0,"type":"paragraph","version":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"await","type":"code-highlight","version":1,"highlightType":"keyword"},{"detail":0,"format":0,"mode":"normal","style":"","text":" encoder","type":"code-highlight","version":1},{"detail":0,"format":0,"mode":"normal","style":"","text":".","type":"code-highlight","version":1,"highlightType":"punctuation"},{"detail":0,"format":0,"mode":"normal","style":"","text":"flush","type":"code-highlight","version":1,"highlightType":"function"},{"detail":0,"format":0,"mode":"normal","style":"","text":"(","type":"code-highlight","version":1,"highlightType":"punctuation"},{"detail":0,"format":0,"mode":"normal","style":"","text":")","type":"code-highlight","version":1,"highlightType":"punctuation"},{"detail":0,"format":0,"mode":"normal","style":"","text":";","type":"code-highlight","version":1,"highlightType":"punctuation"}],"direction":"ltr","format":"","indent":0,"type":"code","version":1,"language":"javascript"}],"direction":"ltr","format":"","indent":0,"type":"root","version":1}}', '2023-11-27 17:30:38.000');

INSERT INTO "PostCate" (id, "postId", "categoryName") VALUES (1, 1, 'PROGRAM');
INSERT INTO "PostCate" (id, "postId", "categoryName") VALUES (2, 1, 'FRONTEND');
INSERT INTO "PostCate" (id, "postId", "categoryName") VALUES (3, 1, 'WEBCODECS');

INSERT INTO "Comment" (id, content, posted, "postId", "userName") VALUES (1, 'Are you planning to use the WebCodecs API? Your public support helps the Chrome team to prioritize features and shows other browser vendors how critical it is to support them.', '2023-11-27 17:33:11.000', 1, 'Aloento');

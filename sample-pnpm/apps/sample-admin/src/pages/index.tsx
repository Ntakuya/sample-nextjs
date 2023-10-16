import prisma from "@sample-project/database";
import { InferGetStaticPropsType, NextPage } from "next";

type PageProps = InferGetStaticPropsType<typeof getStaticProps>

export const getStaticProps = async () => {
    const data = await prisma.post.findMany({select: {
        postUUID: true,
    }})
    console.log(data)
    return {
        props: {data}
    }
}

export const TopPage: NextPage<PageProps> = ({
    data
}) => {
    console.log(data)
    return (
        <div>sample</div>
    )
}
export default TopPage

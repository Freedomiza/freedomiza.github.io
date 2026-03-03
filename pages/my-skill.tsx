import { Box } from "@chakra-ui/react";

import Layout from "components/common/layouts";

const MySkill = () => {
  return <Box>my skill</Box>;
};

export default MySkill;

MySkill.getLayout = function getLayout(page: React.ReactNode) {
  return <Layout>{page}</Layout>;
};

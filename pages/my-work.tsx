import { Box } from "@chakra-ui/react";

import Layout from "components/common/layouts";

const MyWork = () => {
  return <Box>My work</Box>;
};

export default MyWork;

MyWork.getLayout = function getLayout(page) {
  return <Layout>{page}</Layout>;
};

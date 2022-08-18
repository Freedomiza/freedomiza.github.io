"use strict";
exports.id = 589;
exports.ids = [589];
exports.modules = {

/***/ 589:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {


// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "Z": () => (/* binding */ Layout)
});

// EXTERNAL MODULE: external "react"
var external_react_ = __webpack_require__(689);
// EXTERNAL MODULE: external "@chakra-ui/react"
var react_ = __webpack_require__(930);
// EXTERNAL MODULE: ./node_modules/next/link.js
var next_link = __webpack_require__(664);
;// CONCATENATED MODULE: ./constants/routes.ts
const Routes = {
  home: "/",
  contact: "/contact"
};
/* harmony default export */ const routes = (Routes);
// EXTERNAL MODULE: external "react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(997);
;// CONCATENATED MODULE: ./components/common/navbar.tsx






function Navbar({
  children
}) {
  return /*#__PURE__*/(0,jsx_runtime_.jsxs)(react_.Box, {
    w: "100%",
    h: 64,
    p: 4,
    color: "white",
    bgColor: "#171D26",
    as: "nav",
    style: {
      position: "sticky",
      top: 0
    },
    zIndex: 99,
    children: [/*#__PURE__*/(0,jsx_runtime_.jsxs)(react_.HStack, {
      h: "100%",
      children: [/*#__PURE__*/jsx_runtime_.jsx(react_.Box, {
        p: "1rem",
        children: /*#__PURE__*/jsx_runtime_.jsx(react_.Link, {
          as: next_link["default"],
          href: routes.home,
          fontSize: "md",
          children: "About me"
        })
      }), /*#__PURE__*/jsx_runtime_.jsx(react_.Box, {
        p: "1rem",
        children: /*#__PURE__*/jsx_runtime_.jsx(react_.Link, {
          as: next_link["default"],
          href: routes.contact,
          fontSize: "md",
          children: "My contact"
        })
      })]
    }), children]
  });
}
;// CONCATENATED MODULE: ./components/common/footer.tsx



function Footer(props) {
  return /*#__PURE__*/jsx_runtime_.jsx(react_.Box, {
    w: "100%",
    color: "beige",
    h: "sm"
  });
}
;// CONCATENATED MODULE: ./components/common/layouts.tsx






function Layout({
  children
}) {
  return /*#__PURE__*/(0,jsx_runtime_.jsxs)(jsx_runtime_.Fragment, {
    children: [/*#__PURE__*/jsx_runtime_.jsx(Navbar, {}), /*#__PURE__*/jsx_runtime_.jsx(react_.Container, {
      as: "main",
      minHeight: "100vh",
      maxW: "100%",
      background: "linear-gradient(to bottom, #f5f5f5, #e5e5e5)",
      children: children
    }), /*#__PURE__*/jsx_runtime_.jsx(Footer, {})]
  });
}

/***/ })

};
;
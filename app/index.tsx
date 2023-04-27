"use client";

import { Footer } from "@/Components/Footer";
import { NavH, NavW, TopNavBar } from "@/Components/TopNavBar";
import { Calc, Unit } from "@/Styles";
import { ColFlex, Flex } from "@/Styles/Layout";
import { FluentProvider, tokens, webLightTheme } from "@fluentui/react-components";
import dayjs from "dayjs";
import relativeTime from "dayjs/plugin/relativeTime";
import { CommLeft } from "../Components/Left";
import { CommRight } from "../Components/Right";
import "./index.css";

dayjs.extend(relativeTime)

/**
 * Global Layout
 *
 * @author Aloento
 * @since MusiLand 0.2.2
 * @version 0.1.0
 */
export function App({ children }: { children: React.ReactNode }) {
  return (
    <FluentProvider theme={webLightTheme} applyStylesToPortals>
      <TopNavBar />

      <div style={{
        ...ColFlex,
        minWidth: "1024px",
        position: "absolute",
        paddingTop: Calc(Unit(NavH), "+", tokens.spacingVerticalXXXL),
        width: "100%",
        height: "-webkit-fill-available",
        justifyContent: "space-between",
        backgroundColor: tokens.colorNeutralBackground3
      }}>
        <main style={{
          maxWidth: NavW,
          width: "-webkit-fill-available",
          marginLeft: "auto",
          marginRight: "auto",
          paddingLeft: tokens.spacingHorizontalS,
          paddingRight: tokens.spacingHorizontalS,
        }}>
          <div style={{
            ...Flex,
            columnGap: tokens.spacingHorizontalXL
          }}>
            <CommLeft />
            {children}
            <CommRight />
          </div>
        </main>

        <Footer />
      </div>
    </FluentProvider>
  )
}
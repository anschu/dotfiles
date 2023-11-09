-- local get_test_result = function(position)
--   return d(position, function() return sn(nil, c(1, { t " -> Result<()> ", t " " })) end, {})
-- end


return {
  s("modtest",
    fmt(
      [[
        #[cfg(test)]
        mod test {{
        {}
            {}
        }}
      ]],
      {
        c(1, { t "    use super::*;", t "" }),
        i(0)
      }
    )
  ),

  s("test",
    fmt(
      [[
        #[test]
        fn {}() -> Result<()> {{
          {}
          Ok(())
        }}
      ]],
      {
        i(1, "testname"),
        i(0)
      }
    )
  ),

  s('fn',
    fmt(
      [[
        fn {}({}){} {{
          todo!(){}
        }}
      ]],
      {
        i(1),
        i(2),
        c(3, { t " -> {}", t "" }),
        i(0)
      }
    )
  ),

  s('pfn',
    fmt(
      [[
        pub fn {}({}){} {{
          todo!(){}
        }}
      ]],
      {
        i(1),
        i(2),
        c(3, { t " -> {}", t "" }),
        i(0)
      }
    )
  ),

  s('afn',
    fmt(
      [[
        async fn {}({}){} {{
          todo!(){}
        }}
      ]],
      {
        i(1),
        i(2),
        c(3, { t " -> {}", t "" }),
        i(0)
      }
    )
  ),

  s('pafn',
    fmt(
      [[
        pub async fn {}({}){} {{
          todo!(){}
        }}
      ]],
      {
        i(1),
        i(2),
        c(3, { t " -> {}", t "" }),
        i(0)
      }
    )
  ),



  s('moderr',
    fmt(
      [[
        pub type Result<T> = core::result::Result<T, Error>;

        #[derive(Debug)]
        pub enum Error {{
          {}
        }}

        impl core::fmt::Display for Error {{
            fn fmt(&self, fmt: &mut core::fmt::Formatter) -> core::result::Result<(), core::fmt::Error> {{
                write!(fmt, "{{self:?}}")
            }}
        }}

        impl std::error::Error for Error {{}}
    ]],
      {
        i(0),
      }
    )
  )
}

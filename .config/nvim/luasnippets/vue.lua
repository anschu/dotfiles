return {
  s("ssc",
    fmt(
      [[
      <template>
        <div></div>
      </template>

      <script lang="ts" setup>
      {}
      </script>

      {}
      ]],
      {
        i(0),
        c(1, { t "<style scoped></style>", t "" })
      }
    )
  ),

  s("defp",
    fmt(
      [[
        {}defineProps<{{
          {}
        }}>();
      ]],
      {
        c(1, { t "const props = ", t "" }),
        i(0)
      }
    )
  ),

  s("ref", fmt([[ const {} = ref<{}>({}); ]], { i(1), i(2), i(0) })),
  s("com", fmt([[ const {} = computed(() => {}); ]], { i(1), i(0) })),
  s("onm", fmt([[ onMounted(() => {}); ]], { i(0) })),
  s("imp", fmt([[ import {} from '{}'; ]], { i(1), i(0) })),
  s("wat",
    fmt(
      [[
        watch({},({}) => {}{})
      ]],
      {
        i(1),
        i(2),
        i(0),
        c(3, { t "", t ", {{ immediate: true }}" })
      }
    )
  ),

}

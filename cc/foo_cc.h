#pragma once

namespace foo
{
  __attribute__((noinline))
  void do_something()
  { asm("nop"); }
}

#include "invert_lines.h"
#include <llvm/Support/raw_ostream.h>
auto subtract(int x, int y) -> int
{
        return x - y;
}
auto main() -> int
{
        llvm::outs() << "Who's Watching My Stream??\n";
        llvm::outs() << subtract(2, 3) << "\n";
        return 0;
}

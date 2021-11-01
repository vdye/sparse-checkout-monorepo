using System;

namespace SparseApp
{
    class Program
    {
        /*
         * The point of this program is to demonstrate dependency resolution
         * in a sparse checkout repository.
         */
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Console.WriteLine(Core.Messages.CORE_MESSAGE);
            Console.WriteLine(Shared.Messages.SHARED_MESSAGE);
        }
    }
}

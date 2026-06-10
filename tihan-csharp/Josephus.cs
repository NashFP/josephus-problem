static class Josephus
{
    static int Solve(int n, int k)
    {
        if (k <= 0 || k > n)
            return -1;

        var winner = 0;
        for (var i = 1; i <= n; ++i)
        {
            winner = (winner + k) % i;
        }

        return winner + 1;
    }

    static void Main()
    {
        Console.WriteLine(Solve(41, 3)); // 31
        Console.WriteLine(Solve(100000, 5)); // 40333
    }
}
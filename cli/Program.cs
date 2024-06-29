using ConsoleAppFramework;

ConsoleApp.Run(args, Commands.Hello);


static class Commands
{
    /// <summary>
    /// Display Hello.
    /// </summary>
    /// <param name="message">-m|-mm, Message to show.</param>
    public static void Hello(string message) => Console.Write($"Hello, {message}");

}
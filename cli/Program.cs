using ConsoleAppFramework;
using Utils;

var app = ConsoleApp.Create();

app.Run(args);

ConsoleApp.Run(args, Commands.Hello);


static class Commands
{
    /// <summary>
    /// Display Hello.
    /// </summary>
    /// <param name="message">-m|-mm, Message to show.</param>
    public static void Hello(string message) => Console.Write($"Hello, {message}");

    /// <summary>
    /// 
    /// </summary>
    public static void SetUpMac()
    {

    }

    public static void InstallBrew()
    {
        if (!Command.Exists("brew"))
        {
            Console.WriteLine("# Install brew >>>>>>>");

            // Install brew
            Command.Exec("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"");

            // Add brew to the shell environment
            Command.Exec("(echo; echo 'eval \"$(/usr/local/bin/brew shellenv)\"') >> ~/.zprofile");

            // Evaluate the brew shell environment
            ExecuteCommand("/bin/bash", "-c \"eval \\\"$(/usr/local/bin/brew shellenv)\\\"\"");
        }
    }
}
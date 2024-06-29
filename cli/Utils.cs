using System.Diagnostics;

namespace Utils
{
    enum Platform
    {
        Linux,
        Mac,
        Windows,
        Other,
    }

    static class Command
    {
        public static Platform GetPlatform()
        {
            return Environment.OSVersion.Platform switch
            {
                PlatformID.Win32NT => Platform.Windows,
                PlatformID.MacOSX => Platform.Mac,
                PlatformID.Unix => Platform.Linux,
                _ => Platform.Other,
            };
        }

        public static bool Exists(string command)
        {
            return Exec($"type {command}");
        }

        public static bool Exec(string arguments)
        {
            return Exec("/bin/bash", arguments);
        }

        public static bool ExecMessage(string message, string arguments)
        {
            Console.Write(message);
            var result = Exec(arguments);
            Console.WriteLine();
            return result;
        }

        public static bool Exec(string fileName, string arguments)
        {
            try
            {
                var startInfo = new ProcessStartInfo
                {
                    FileName = fileName,
                    Arguments = arguments,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
                    UseShellExecute = false,
                    CreateNoWindow = true
                };

                using (var process = Process.Start(startInfo))
                {
                    if (process == null) return false;

                    process.OutputDataReceived += (sender, args) => Console.WriteLine(args.Data);
                    process.ErrorDataReceived += (sender, args) => Console.WriteLine("ERROR: " + args.Data);
                    process.BeginOutputReadLine();
                    process.BeginErrorReadLine();
                    process.WaitForExit();
                    return process.ExitCode == 0;
                }
            }
            catch
            {
                return false;
            }
        }

    }
}
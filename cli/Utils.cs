using System.Diagnostics;

namespace Utils
{
    class Command
    {
        public static bool Exists(string command)
        {
            return Exec($"type {command}");
        }

        public static bool Exec(string arguments)
        {
            return Exec("/bin/bash", arguments);
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
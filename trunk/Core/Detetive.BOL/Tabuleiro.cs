using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Detetive.BOL
{
    public class Tabuleiro
    {
        public int[][] positions { get; set; }

        public Tabuleiro()
        {
            positions = new int[25][];
            positions[0]  = new int[] { 00, 00, 00,  00,  00,  00, 00, 01, 00, 00, 00,  00,  00,  00, 00, 00, 94, 00, 00, 00,  00,  00,  00, 00 };
            positions[1]  = new int[] { 00, 00, 811, 812, 813, 00, 00, 01, 01, 00, 00,  00,  00,  00, 00, 01, 01, 00, 00, 00,  00,  00,  00, 00 };
            positions[2]  = new int[] { 00, 00, 814, 815, 816, 00, 00, 01, 01, 00, 821, 822, 00,  00, 00, 01, 01, 00, 00, 831, 832, 833, 00, 00 };
            positions[3]  = new int[] { 00, 00, 00,  00,  00,  00, 81, 01, 01, 00, 823, 824, 00,  00, 00, 01, 01, 00, 00, 834, 835, 836, 00, 00 };
            positions[4]  = new int[] { 00, 01, 01,  01,  01,  01, 01, 01, 01, 00, 825, 826, 00,  00, 00, 01, 01, 00, 00, 00,  00,  00,  00, 00 };
            positions[5]  = new int[] { 93, 01, 01,  01,  01,  01, 01, 01, 01, 00, 00,  00,  00,  00, 00, 01, 01, 83, 00, 00,  00,  00,  00, 00 };
            positions[6]  = new int[] { 00, 00, 00,  00,  00,  00, 01, 01, 01, 00, 00,  82,  82,  00, 00, 01, 01, 01, 01, 01,  01,  01,  01, 00 };
            positions[7]  = new int[] { 00, 00, 891, 892, 893, 00, 00, 01, 01, 01, 01,  01,  01,  01, 01, 01, 01, 01, 01, 01,  01,  01,  01, 95 };
            positions[8]  = new int[] { 00, 00, 894, 895, 896, 00, 89, 01, 01, 00, 00,  00,  00,  00, 01, 01, 01, 01, 01, 01,  01,  01,  01, 00 };
            positions[9]  = new int[] { 00, 00, 00,  00,  00,  00, 00, 01, 01, 00, 00,  00,  00,  00, 01, 01, 00, 84, 00, 00,  00,  00,  00, 00 };
            positions[10] = new int[] { 00, 00, 00,  89,  00,  00, 01, 01, 01, 00, 00,  00,  00,  00, 01, 01, 00, 00, 00, 00,  00,  00,  00, 00 };
            positions[11] = new int[] { 00, 01, 01,  10,  01,  01, 01, 01, 01, 00, 00,  00,  00,  00, 01, 01, 00, 00, 00, 841, 842, 00,  00, 00 };
            positions[12] = new int[] { 00, 88, 00,  00,  00,  00, 01, 01, 01, 00, 00,  00,  00,  00, 01, 01, 84, 00, 00, 843, 844, 00,  00, 00 };
            positions[13] = new int[] { 00, 00, 881, 882, 00,  00, 01, 01, 01, 00, 00,  00,  00,  00, 01, 01, 00, 00, 00, 845, 846, 00,  00, 00 };
            positions[14] = new int[] { 00, 00, 883, 884, 00,  00, 01, 01, 01, 00, 00,  00,  00,  00, 01, 01, 00, 00, 00, 00,  00,  00,  00, 00 };
            positions[15] = new int[] { 00, 00, 885, 886, 00,  88, 01, 01, 01, 01, 01,  01,  01,  01, 01, 01, 01, 01, 01, 00,  00,  00,  00, 00 };
            positions[16] = new int[] { 00, 00, 00,  00,  00,  00, 01, 01, 01, 01, 01,  01,  01,  01, 01, 01, 01, 01, 01, 01,  01,  01,  01, 00 };
            positions[17] = new int[] { 00, 01, 01,  01,  01,  01, 01, 01, 00, 86, 00,  00,  00,  00, 86, 00, 01, 01, 01, 01,  01,  01,  01, 01 };
            positions[18] = new int[] { 92, 01, 01,  01,  01,  01, 01, 01, 00, 00, 00,  00,  00,  00, 00, 00, 01, 01, 00, 85,  00,  00,  00, 00 };
            positions[19] = new int[] { 00, 00, 00,  00,  87,  01, 01, 01, 86, 00, 00,  861, 862, 00, 00, 86, 01, 01, 00, 00,  00,  00,  00, 00 };
            positions[20] = new int[] { 00, 00, 871, 872, 00,  00, 01, 01, 00, 00, 00,  863, 864, 00, 00, 00, 01, 01, 00, 00,  851, 852, 00, 00 };
            positions[21] = new int[] { 00, 00, 873, 874, 00,  00, 01, 01, 00, 00, 00,  865, 866, 00, 00, 00, 01, 01, 00, 00,  853, 854, 00, 00 };
            positions[22] = new int[] { 00, 00, 875, 876, 00,  00, 01, 01, 00, 00, 00,  00,  00,  00, 00, 00, 01, 01, 00, 00,  855, 856, 00, 00 };
            positions[23] = new int[] { 00, 00, 00,  00,  00,  00, 00, 01, 01, 01, 00,  00,  00,  00, 01, 01, 01, 00, 00, 00,  00,  00,  00, 00 };
            positions[24] = new int[] { 00, 00, 00,  00,  00,  00, 00, 00, 00, 91, 00,  00,  00,  00, 96, 00, 00, 00, 00, 00,  00,  00,  00, 00 };
        }

        public override string ToString()
        {
            string result = string.Empty;
            for (int i = 0; i < 25; i++)
            {
                for (int j = 0; j < 24; j++)
                {
                    result += string.Format("{0},", this.positions[i][j]);
                }
                result = result.Remove(result.Length - 1);
                result += "|";
            }

            return result;
        }

        public void FromString(string req)
        {
            string[] lines = req.Split(new string[] { "|" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 0; i < lines.Length; i++)
            {
                string[] line = lines[i].Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                for (int j = 0; j < line.Length; j++)
                {
                    this.positions[i][j] = Convert.ToInt32(line[j]);
                }
            }
        }

        public static string StartPosition(int color, out string js)
        {
            string result = string.Empty;
            js = string.Empty;
            switch (color)
            {
                case 91:
                    result = "24_9";
                    js = "$(\"#" + result + "\").removeClass();";
                    js += "$(\"#" + result + "\").addClass('pinkMove');";
                    break;
                case 92:
                    result = "18_0";
                    js = "$(\"#" + result + "\").removeClass();";
                    js += "$(\"#" + result + "\").addClass('blueMove');";
                    break;
                case 93:
                    result = "5_0";
                    js = "$(\"#" + result + "\").removeClass();";
                    js += "$(\"#" + result + "\").addClass('whiteMove');";
                    break;
                case 94:
                    result = "0_16";
                    js = "$(\"#" + result + "\").removeClass();";
                    js += "$(\"#" + result + "\").addClass('yellowMove');";
                    break;
                case 95:
                    result = "7_23";
                    js = "$(\"#" + result + "\").removeClass();";
                    js += "$(\"#" + result + "\").addClass('purpleMove');";
                    break;
                case 96:
                    result = "24_14";
                    js = "$(\"#" + result + "\").removeClass();";
                    js += "$(\"#" + result + "\").addClass('greenMove');";
                    break;
            }
            return result;
        }

        public static string SetPosition(int color, string position)
        {
            string result = string.Empty;
            switch (color)
            {
                case 91:
                    result = "$(\"#" + position + "\").removeClass();";
                    result += "$(\"#" + position + "\").addClass('pinkMove');";
                    break;
                case 92:
                    result = "$(\"#" + position + "\").removeClass();";
                    result += "$(\"#" + position + "\").addClass('blueMove');";
                    break;
                case 93:
                    result = "$(\"#" + position + "\").removeClass();";
                    result += "$(\"#" + position + "\").addClass('whiteMove');";
                    break;
                case 94:
                    result = "$(\"#" + position + "\").removeClass();";
                    result += "$(\"#" + position + "\").addClass('yellowMove');";
                    break;
                case 95:
                    result = "$(\"#" + position + "\").removeClass();";
                    result += "$(\"#" + position + "\").addClass('purpleMove');";
                    break;
                case 96:
                    result = "$(\"#" + position + "\").removeClass();";
                    result += "$(\"#" + position + "\").addClass('greenMove');";
                    break;
            }
            return result;
        }
    }
}

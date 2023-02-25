using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace WindowsFormsApp3
{
	public partial class Form1 : Form
	{
		DriveInfo[] allDrives = DriveInfo.GetDrives();
		Timer myTimer = new Timer();

		public Form1()
		{
			InitializeComponent();
			myTimer.Tick += new EventHandler(ShowAfterTime);
			myTimer.Interval = 3000;
			myTimer.Start();
		}

		private void ShowAfterTime(Object myObject,
											EventArgs myEventArgs)
		{
			System.Diagnostics.Process proc = System.Diagnostics.Process.GetCurrentProcess();
			int l_i = 0;
			foreach (DriveInfo d in allDrives)
			{
				if (d.IsReady == true)
				{
					if (l_i == 0)
					{
						this.label1.Text = d.AvailableFreeSpace.ToString();
					}
					else if (l_i == 1)
					{
						this.label2.Text = d.AvailableFreeSpace.ToString();
					}
					l_i += 1;
				}
			}
			this.label3.Text = proc.PrivateMemorySize64.ToString();
		}

		private void Button1_Click(object sender, EventArgs e)
		{

		}

		private void DisplayFiles(string filePath)
		{
			string[] fileList = Directory.GetDirectories(filePath).Concat(Directory.GetFiles(filePath)).ToArray();
		}
	}
}

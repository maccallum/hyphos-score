{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 6,
			"minor" : 1,
			"revision" : 4,
			"architecture" : "x86"
		}
,
		"rect" : [ 333.0, 44.0, 1437.0, 878.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 868.5, 728.0, 32.5, 20.0 ],
					"text" : "- 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 841.5, 632.0, 46.0, 20.0 ],
					"text" : "t b b l"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "float" ],
					"patching_rect" : [ 868.5, 696.0, 73.0, 20.0 ],
					"text" : "unpack 0 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 928.0, 760.0, 89.0, 20.0 ],
					"text" : "pack set 1 0 0."
				}

			}
, 			{
				"box" : 				{
					"cols" : 2,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-16",
					"maxclass" : "jit.cellblock",
					"numinlets" : 2,
					"numoutlets" : 4,
					"outlettype" : [ "list", "", "", "" ],
					"patching_rect" : [ 56.5, 384.0, 200.0, 472.0 ],
					"rows" : 1000
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-15",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 304.0, 56.0, 32.5, 18.0 ],
					"text" : "2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-14",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 264.0, 56.0, 32.5, 18.0 ],
					"presentation_rect" : [ 264.0, 56.0, 0.0, 0.0 ],
					"text" : "1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-13",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 224.0, 56.0, 32.5, 18.0 ],
					"presentation_rect" : [ 224.0, 57.0, 0.0, 0.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 872.5, 496.0, 90.0, 20.0 ],
					"presentation_rect" : [ 842.5, 404.0, 0.0, 0.0 ],
					"text" : "o.pack /mbar 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 841.5, 544.0, 50.0, 20.0 ],
					"presentation_rect" : [ 811.5, 452.0, 0.0, 0.0 ],
					"text" : "o.union"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "int", "clear" ],
					"patching_rect" : [ 224.0, 120.0, 59.0, 20.0 ],
					"text" : "t l 1 clear"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 4,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 841.5, 760.0, 85.0, 20.0 ],
					"text" : "pack set 0 0 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "FullPacket" ],
					"patching_rect" : [ 841.5, 392.0, 131.0, 20.0 ],
					"text" : "o.route /function/*/beat"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "FullPacket" ],
					"patching_rect" : [ 868.5, 664.0, 99.0, 20.0 ],
					"text" : "o.route /bar/bpm"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 728.0, 416.0, 44.0, 20.0 ],
					"text" : "o.print"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "FullPacket" ],
					"patching_rect" : [ 841.5, 584.0, 231.0, 20.0 ],
					"text" : "o.expr /bar/bpm = [/mbar++\\, /tempo * 60.]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "FullPacket", "FullPacket" ],
					"patching_rect" : [ 841.5, 440.0, 108.0, 20.0 ],
					"text" : "o.if /beat % 4 == 0"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-91",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 224.0, 88.0, 228.0, 18.0 ],
					"text" : "dumpbeats functions $1 timerange 0 240"
				}

			}
, 			{
				"box" : 				{
					"color" : [ 1.0, 1.0, 1.0, 1.0 ],
					"colors" : [ 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"freqmax" : 3.5,
					"functions" : [ 8, 0.0, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 168.465042, 1.333333, 1.333333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 208.418289, 2.4, 2.4, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 306.017365, 1.4, 1.4, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 467.759369, 2.2, 2.2, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 588.418701, 1.666667, 1.666667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 802.375305, 2.2, 2.2, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 978.6875, 2.666667, 2.666667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 9, 0.0, 1.933333, 1.933333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 133.559952, 1.466667, 1.466667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 203.773743, 2.666667, 2.666667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 452.299408, 1.666667, 1.666667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 487.349518, 2.2, 2.2, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 556.35968, 1.333333, 1.333333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 727.50177, 2.4, 2.4, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 776.664429, 2.0, 2.0, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 938.658752, 2.8, 2.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 10, 0.0, 1.6, 1.6, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 70.334953, 0.9, 0.9, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 114.943039, 2.1, 2.1, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 178.086823, 1.533333, 1.533333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 269.561005, 2.2, 2.2, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 412.059509, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 608.451782, 2.533333, 2.533333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 815.991699, 1.0, 1.0, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 847.485168, 2.533333, 2.533333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 896.926208, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 8, 0.0, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 108.436356, 2.666667, 2.666667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 320.541077, 1.733333, 1.733333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 433.237244, 2.533333, 2.533333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 535.619873, 1.933333, 1.933333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 605.732788, 3.066667, 3.066667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 819.434875, 1.533333, 1.533333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 998.286316, 1.15, 1.15, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 9, 0.0, 2.3, 2.3, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 111.591194, 1.05, 1.05, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 176.079056, 2.2, 2.2, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 412.413788, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 458.675842, 2.933333, 2.933333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 503.455902, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 601.187744, 2.3, 2.3, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 658.134216, 1.6, 1.6, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 989.447876, 1.15, 1.15, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 12, 0.0, 1.05, 1.05, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 49.670834, 2.3, 2.3, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 101.787109, 1.333333, 1.333333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 182.212326, 2.2, 2.2, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 222.150665, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 334.477142, 2.4, 2.4, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 372.378815, 2.0, 2.0, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 692.036316, 1.2, 1.2, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 777.975159, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 882.070557, 2.8, 2.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 943.038086, 1.333333, 1.333333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 977.042969, 2.666667, 2.666667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 10, 0.0, 1.8, 1.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 47.12344, 0.966667, 0.966667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 107.650391, 2.666667, 2.666667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 173.442703, 1.0, 1.0, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 234.797394, 2.4, 2.4, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 398.165466, 2.8, 2.8, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 438.671967, 1.933333, 1.933333, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 479.795166, 2.666667, 2.666667, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 663.801147, 1.0, 1.0, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 751.575317, 1.6, 1.6, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 3, 0.0, 1.0, 1.0, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0, 420.0, 1.0, 1.0, 0.0, 0.0, 0.1, 0.9, 2.0, 2.0, 2.0, 2.0, 0, 720.0, 0.2, 0.2, 0.0, 0.0, 0.1, 0.9, 1.0, 1.0, 2.0, 2.0, 0 ],
					"id" : "obj-1",
					"major_grid_width_sec" : 60.0,
					"maxclass" : "timewarp~",
					"name" : "tw",
					"numinlets" : 2,
					"numoutlets" : 7,
					"outlettype" : [ "signal", "signal", "signal", "signal", "signal", "", "" ],
					"patching_rect" : [ 224.0, 152.0, 760.0, 200.0 ],
					"show_beats" : 0,
					"show_xaxis" : 1,
					"show_yaxis" : 1,
					"timemax" : 1500.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-10", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-14", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 851.0, 622.0, 1109.0, 622.0, 1109.0, 527.0, 882.0, 527.0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-18", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "timewarp~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.if.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.expr.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.print.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.route.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.union.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.pack.mxo",
				"type" : "iLaX"
			}
 ]
	}

}

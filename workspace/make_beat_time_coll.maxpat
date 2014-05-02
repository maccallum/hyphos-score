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
		"rect" : [ 108.0, 44.0, 1350.0, 924.0 ],
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
					"id" : "obj-129",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 56.0, 752.0, 36.0, 18.0 ],
					"text" : "write"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 786.5, 640.0, 107.0, 20.0 ],
					"text" : "o.route /beat /time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-121",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 679.5, 640.0, 107.0, 20.0 ],
					"text" : "o.route /beat /time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-115",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 572.5, 640.0, 107.0, 20.0 ],
					"text" : "o.route /beat /time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-109",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 465.5, 640.0, 107.0, 20.0 ],
					"text" : "o.route /beat /time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 358.5, 688.0, 27.0, 20.0 ],
					"text" : "b 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 358.5, 712.0, 73.0, 20.0 ],
					"text" : "counter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-100",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 358.5, 816.0, 59.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-101",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 358.5, 784.0, 116.0, 20.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"text" : "coll viola_beat_time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-102",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 358.5, 744.0, 59.0, 20.0 ],
					"text" : "pack 0 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 358.5, 640.0, 107.0, 20.0 ],
					"text" : "o.route /beat /time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 251.5, 688.0, 27.0, 20.0 ],
					"presentation_rect" : [ 251.5, 687.0, 0.0, 0.0 ],
					"text" : "b 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 251.5, 712.0, 73.0, 20.0 ],
					"presentation_rect" : [ 251.5, 711.0, 0.0, 0.0 ],
					"text" : "counter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-94",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 251.5, 816.0, 59.0, 20.0 ],
					"presentation_rect" : [ 251.5, 815.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 251.5, 784.0, 162.0, 20.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"text" : "coll bass_clarinet_beat_time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 251.5, 744.0, 59.0, 20.0 ],
					"presentation_rect" : [ 251.5, 743.0, 0.0, 0.0 ],
					"text" : "pack 0 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 251.5, 640.0, 107.0, 20.0 ],
					"presentation_rect" : [ 251.5, 639.0, 0.0, 0.0 ],
					"text" : "o.route /beat /time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "bang", "", "int", "clear" ],
					"patching_rect" : [ 222.333328, 120.0, 69.0, 20.0 ],
					"presentation_rect" : [ 630.0, 134.0, 0.0, 0.0 ],
					"text" : "t b l 0 clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-89",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 222.333328, 41.0, 20.0, 20.0 ],
					"presentation_rect" : [ 635.0, 59.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 222.333328, 81.0, 248.0, 20.0 ],
					"text" : "pack dumpbeats functions * timerange 0 720"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 144.5, 688.0, 27.0, 20.0 ],
					"presentation_rect" : [ 580.5, 863.0, 0.0, 0.0 ],
					"text" : "b 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 144.5, 712.0, 73.0, 20.0 ],
					"presentation_rect" : [ 580.5, 887.0, 0.0, 0.0 ],
					"text" : "counter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-74",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 144.5, 816.0, 59.0, 20.0 ],
					"presentation_rect" : [ 580.5, 991.0, 0.0, 0.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "", "", "", "" ],
					"patching_rect" : [ 144.5, 784.0, 114.0, 20.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0
					}
,
					"text" : "coll flute_beat_time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 144.5, 744.0, 59.0, 20.0 ],
					"presentation_rect" : [ 580.5, 919.0, 0.0, 0.0 ],
					"text" : "pack 0 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "FullPacket" ],
					"patching_rect" : [ 144.5, 640.0, 107.0, 20.0 ],
					"text" : "o.route /beat /time"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 9,
					"numoutlets" : 9,
					"outlettype" : [ "", "", "", "", "", "", "", "", "FullPacket" ],
					"patching_rect" : [ 144.5, 608.0, 368.0, 20.0 ],
					"text" : "o.route /0/beat /1/beat /2/beat /3/beat /4/beat /5/beat /6/beat /7/beat"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "FullPacket" ],
					"patching_rect" : [ 144.5, 576.0, 97.0, 20.0 ],
					"presentation_rect" : [ 580.5, 727.0, 0.0, 0.0 ],
					"text" : "o.route /function"
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
					"patching_rect" : [ 239.0, 167.0, 760.0, 200.0 ],
					"show_beats" : 0,
					"show_xaxis" : 1,
					"show_yaxis" : 1,
					"timemax" : 1500.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-102", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-103", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-101", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-74", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-86", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-109", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-121", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-97", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-87", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-93", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-92", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-97", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "flute_beat_time.coll",
				"bootpath" : "/Users/john/jmac/compositions/Earplay/workspace",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "bass_clarinet_beat_time.coll",
				"bootpath" : "/Users/john/jmac/compositions/Earplay/workspace",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "viola_beat_time.coll",
				"bootpath" : "/Users/john/jmac/compositions/Earplay/workspace",
				"patcherrelativepath" : ".",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "timewarp~.mxo",
				"type" : "iLaX"
			}
, 			{
				"name" : "o.route.mxo",
				"type" : "iLaX"
			}
 ]
	}

}

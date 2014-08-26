package com.core.module.main.view
{
	import com.core.MainApplaction;
	import com.core.globals.GiftType;
	import com.core.layout.HBox;

	import flash.geom.Point;

	import starling.display.Sprite;

	public class GiftSelectView extends Sprite
	{
		private static var _instance:GiftSelectView;
		private var _seletedCanvas:HBox;

		public function GiftSelectView()
		{
			super();
			var pointArr:Vector.<Point>=getCiclePoints(10, new Point(350, 200), 150);
			var i:int=0;
			for each (var gift:uint in GiftType.ALL_GIFT)
			{
				var cell:GiftCell=new GiftCell(gift);
				cell.x=pointArr[i].x;
				cell.y=pointArr[i].y;
				this.addChild(cell);
				i++;
			}

			_seletedCanvas=new HBox(3);
			_seletedCanvas.x=300;
			_seletedCanvas.y=200;
			this.addChild(_seletedCanvas);
			_seletedCanvas.addChild(new GiftCell(0x0a));
			_seletedCanvas.addChild(new GiftCell(0x100));
			_seletedCanvas.addChild(new GiftCell(0x80));
		}

		public static function show():void
		{
			if (!_instance)
				_instance=new GiftSelectView();
			MainApplaction.getInstance()._mainLayer.addChild(_instance);
		}

		public static function close():void
		{
			if (_instance && _instance.parent)
				_instance.parent.removeChild(_instance);
			_instance.dispose();
		}

		public static function get instance():GiftSelectView
		{
			return _instance;
		}

		public static function getCiclePoints(count:int, centerPoint:Point, r:Number):Vector.<Point>
		{
			var ret:Vector.<Point>=new Vector.<Point>();
			var delta:Number=2 * Math.PI / count;
			for (var alp:Number=0; alp < 2 * Math.PI; alp+=delta)
			{
				var pX:Number=2 * r * Math.sin(alp) + centerPoint.x;
				var pY:Number=r * Math.cos(alp) + centerPoint.y;
				ret.push(new Point(pX, pY));
			}
			return ret;
		}
	}
}

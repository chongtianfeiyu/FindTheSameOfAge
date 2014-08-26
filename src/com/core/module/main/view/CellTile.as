package com.core.module.main.view
{
	import com.core.module.main.model.RandomSkillList;
	import com.core.vo.SkillVO;

	import flash.geom.Point;

	import starling.display.Sprite;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;

	public class CellTile extends Sprite
	{
		private static const CELL_SPACE:int=15;
		private var _cellList:Vector.<SkillCell>;
		private var _cellW:int;
		private var _cellH:int;

		public var _selectedCells:Vector.<SkillCell>=new Vector.<SkillCell>();

		public function CellTile(w:int, h:int)
		{
			super();
			this.x=50;
			this.y=80;
			_cellW=w;
			_cellH=h;
			_cellList=new Vector.<SkillCell>(w * h, true);
			_selectedCells=new Vector.<SkillCell>();
			var skillVOList:Vector.<SkillVO>=RandomSkillList.getRandomSkillList(w * h);
			var pos:Point=new Point();
			for each (var vo:SkillVO in skillVOList)
			{
				this.addCell(pos, vo);
				if (pos.x < _cellW - 1)
				{
					pos.x++;
				}
				else
				{
					pos.x=0;
					pos.y++;
				}
			}

		}

		private function onTouched(e:TouchEvent):void
		{
			var cell:SkillCell=e.currentTarget as SkillCell;
			if (!e.getTouch(cell, TouchPhase.BEGAN))
				return;
			cell.selected=!cell.selected;
			var index:int=_selectedCells.indexOf(cell);
			if (index != -1)
			{
				_selectedCells.splice(index, 1);
			}
			else if (_selectedCells.length < 2)
			{
				_selectedCells.push(cell);
				cell.selected=true;
			}
			else if (_selectedCells.length == 2)
			{
				_selectedCells.shift().selected=false;
				_selectedCells.push(cell);
			}
			trace(_selectedCells.length);
			if (_selectedCells.length == 2)
				checkTheSame();
			e.stopImmediatePropagation();
		}

		private function checkTheSame():void
		{
			var cell1:SkillCell=_selectedCells[0];
			var cell2:SkillCell=_selectedCells[1];
			if (cell1.skillVO.id == cell2.skillVO.id)
			{
//				cell1.visible=cell2.visible=false;
				this.removeChild(cell1);
				this.removeChild(cell2);
				while (_selectedCells.length > 0)
					_selectedCells.pop();
			}
		}

		public function addCell(pos:Point, skillVO:SkillVO):void
		{
			var cell:SkillCell=new SkillCell(pos, skillVO);
			cell.x=pos.x * (SkillCell.SIZE + CELL_SPACE) - CELL_SPACE;
			cell.y=pos.y * (SkillCell.SIZE + CELL_SPACE) - CELL_SPACE;
			_cellList[getIndex(pos)]=cell;
			this.addChild(cell);
			cell.addEventListener(TouchEvent.TOUCH, onTouched);
		}

		override public function dispose():void
		{
			while (this.numChildren > 0)
			{
				var cell:SkillCell=this.removeChildAt(0) as SkillCell;
				if (cell)
					cell.removeEventListeners(TouchEvent.TOUCH);
			}
			super.dispose();
		}

		private function getIndex(pos:Point):int
		{
			return pos.y * _cellH + pos.x;
		}
	}
}

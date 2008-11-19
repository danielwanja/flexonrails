package com.flexonrails.outliner.model {
	
	import com.flexonrails.outliner.vo.OutlinePoint;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ICollectionView;
	import mx.controls.treeClasses.DefaultDataDescriptor;

	public class OutlinePointTreeDataDescriptor extends DefaultDataDescriptor {
		
		override public function hasChildren(node:Object, model:Object=null):Boolean {
			var point:OutlinePoint = node as OutlinePoint;
			return (point.children && point.children.length > 0);
		} 
		
		override public function isBranch(node:Object, collection:Object=null):Boolean {
			return hasChildren(node);
		}
		
		override public function getChildren(node:Object, model:Object=null):ICollectionView {
			var point:OutlinePoint = node as OutlinePoint;
			return point.children;
		}
		
	}
}
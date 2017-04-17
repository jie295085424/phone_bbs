package com.bbs.entity;

import java.util.ArrayList;
import java.util.List;

public class CommentTree {
	private StringBuffer html = new StringBuffer();
	private List<Comment> nodes;
	public CommentTree(List<Comment> nodes){  
        this.nodes = nodes;  
	}
	 public String buildTree(){  
	        html.append("<ul>");  
	        for (Comment node : nodes) {  
	            if (node.getParentId()==0) {  
	                html.append("\r\n<li id='" + node.getId() + "'>" + node.getContent()+ "</li>");  
	                build(node);  
	            }  
	        }  
	        html.append("\r\n</ul>");  
	        return html.toString();  
	    }  
	      
	    private void build(Comment node){  
	        List<Comment> children = getChildren(node);  
	        if (!children.isEmpty()) {  
	            html.append("\r\n<ul>");  
	            for (Comment child : children) {  
	                Integer id = child.getId();  
	                html.append("\r\n<li id='" + id + "'>" + child.getContent()+ "</li>");  
	                build(child);  
	            }  
	            html.append("\r\n</ul>");  
	        }   
	    }  
	      

		private List<Comment> getChildren(Comment node){  
	        List<Comment> children = new ArrayList<Comment>();  
	        Integer id = node.getId();  
	        for (Comment child : nodes) {  
	            if (id.equals(child.getParentId())) {  
	                children.add(child);  
	            }  
	        }  
	        return children;  
	    }  
	
}
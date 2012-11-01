function showTooltip(evt, label) {
//  alert(evt.currentTarget.getElementsByTagName("rect")[0].x.animVal.value);

  var svgNS = "http://www.w3.org/2000/svg";

  // onmouseover is on the <g> element for a (graph) node
  // The first non-text (SVG) node child of the target 
  // should be the shape element for the (graph) node
  var target = evt.currentTarget;
  var targetChildren = target.childNodes;
  var targetShape = null;
  for (i = 0; i < targetChildren.length; i++) {
    if (targetChildren[i].nodeType != 3) { // !TEXT_NODE
      targetShape = targetChildren[i];
      break;
    }
  }
  // If the search for the (graph) node shape failed, BAIL OUT
  if (!targetShape) {
    return;
  }
  
  // Create new text node, rect and text for the tooltip
  var content = document.createTextNode(label);  

  var text = document.createElementNS(svgNS, "text");
  text.setAttribute("id", "tooltipText");
  text.appendChild(content);  

  var rect = document.createElementNS(svgNS, "rect");
  rect.setAttribute("id", "tooltipRect");

  // Add rect and text to topmost document <g>, in that order
  var topg = document.getElementsByTagName("g")[0];
  topg.appendChild(rect);
  topg.appendChild(text);
  // Width of overall image
  var width = topg.parentNode.getBBox().width;

  // Determine position for tooltip based on location of 
  // element that mouse is over
  // AND size of text label
  var tooltipx = targetShape.getBBox().x + targetShape.getBBox().width;
  var tooltiplabx = tooltipx + 5;
  var tooltipy = targetShape.getBBox().y + targetShape.getBBox().height;
  var tooltiplaby = tooltipy + 5;

  // Position tooltip rect and text
  text.setAttribute("transform", 
                    "translate(" + tooltiplabx + ", " + tooltiplaby + ") " +
                    "scale(1, -1)");

  rect.setAttribute("x", tooltipx);
  rect.setAttribute("y", tooltipy);
  rect.setAttribute("width", text.getBBox().width + 10);
  rect.setAttribute("height", text.getBBox().height + 5);
  rect.setAttribute("stroke", "black");
  rect.setAttribute("fill", "yellow");

  // If we are too close to the right-hand edge of the image
  // reposition rect and text to be top-left and right-aligned
  if (tooltipx + rect.getBBox().width > width) {
    tooltipx = targetShape.getBBox().x - text.getBBox().width - 10;
    tooltiplabx = tooltipx + 5;
    text.setAttribute("transform", 
                      "translate(" + tooltiplabx + ", " + tooltiplaby + ") " +
                      "scale(1, -1)");

    rect.setAttribute("x", tooltipx);
  } 
}

function hideTooltip() {
  // Remove tooltip text and rect
  var text = document.getElementById("tooltipText");
  text.parentNode.removeChild(text);
  var rect = document.getElementById("tooltipRect");
  rect.parentNode.removeChild(rect);  
}

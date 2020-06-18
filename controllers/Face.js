const faceapi = require("face-api.js");
const canvas = require("canvas");
const { Canvas, Image, ImageData, loadImage } = canvas;

faceapi.env.monkeyPatch({ Canvas, Image, ImageData });

Promise.all([
  faceapi.nets.faceRecognitionNet.loadFromDisk("./facemodels"),
  faceapi.nets.faceLandmark68Net.loadFromDisk("./facemodels"),
  faceapi.nets.ssdMobilenetv1.loadFromDisk("./facemodels")
])
  .then(console.log("Label Are loaded.."))
  .catch(e => {
    console.log("Label error " + e);
  });

async function createFaceMatcher(content) {
  try {
    for (var x = 0; x < Object.keys(content).length; x++) {
      for (var y = 0; y < Object.keys(content[x]._descriptors).length; y++) {
        var results = Object.values(content[x]._descriptors[y]);
        content[x]._descriptors[y] = new Float32Array(results);
      }
    }

    const labeledFaceDescriptors = await Promise.all(
      content.map(className => {
        const descriptors = [];
        for (var i = 0; i < className._descriptors.length; i++) {
          descriptors.push(className._descriptors[i]);
        }
        return new faceapi.LabeledFaceDescriptors(
          className._label,
          descriptors
        );
      })
    );

    return new faceapi.FaceMatcher(labeledFaceDescriptors, 0.6);
  } catch (err) {
    console.log(err);
  }
}

async function facerec(labeledFaceDescriptors, url) {
  try {
    console.log("Face recognition Strated ....");
    const facematcher = await createFaceMatcher(labeledFaceDescriptors);
    console.log(facematcher);

    const img = await loadImage(url).catch(e => console.log("error ", e));
    // const img =  await faceapi.bufferToImage(url)

    const detections = await faceapi
      .detectAllFaces(img)
      .withFaceLandmarks()
      .withFaceDescriptors();

    const results = detections.map(d =>
      facematcher.findBestMatch(d.descriptor)
    );

    const result = [];
    results.forEach(value => {
      result.push(value.label);
    });
    console.log("finished....");
    return result;
  } catch (err) {
    console.log(err);
  }
}

async function loadlabel(url, label, res) {
  console.log("Load Label On face Strted....");
  try {
    const img = await canvas.loadImage(url);

    const detections = await faceapi
      .detectSingleFace(img)
      .withFaceLandmarks()
      .withFaceDescriptor();

    if (detections) {
      const resultDetections = new faceapi.LabeledFaceDescriptors(label, [detections.descriptor])
      return resultDetections;
    }
    else false;
  } catch (error) {
    return res.json({ Error: error });
  }

}

module.exports = { loadlabel, facerec };

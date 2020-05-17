function convertRotation(rotation) {
    if(rotation.includes('0'))
	    return '0 degrees';
	else if(rotation.includes('1'))
		return '90 degrees';
	else if(rotation.includes('2'))
		return '180 degrees';
	else if(rotation.includes('3'))
		return '270 degrees';
	return `error unkown rotation ${rotation}`;
}

const apiFetch = async(body) => {
	const response = await fetch('http://raspberrypi:6395/', {
		method: 'POST',
		body: body,
		headers: {
			'Content-Type': 'application/json'
		}
	});
	const json = await response.json();
	return json.data;
};

const updateDom = async() => {
	const data = await apiFetch('{"query":"{rotation}"}');
	const rawRotation = data.rotation;
	const rotation = convertRotation(rawRotation);
	const rotationDisplayer = document.getElementById('rotationDisplayer');
	rotationDisplayer.innerHTML = rotation;
};

const rotateDisplay = async() => {
	const data = await apiFetch('{"query":"{rotateDisplay}"}');
	const rotation = data.rotateDisplay;
	const strRotation = convertRotation(rotation);
	await updateDom();
};

const restartComputer = async() => {
	if(confirm('Are you sure you want to restart the computer?')){
		console.log('restarting computer');
		apiFetch('{"query":"{rebootPi}"}');
	}
}; 

import * as React from 'react';
import Alert from '@mui/material/Alert';
import Stack from '@mui/material/Stack';

export default function Alerts(props) {
	return (
		<Stack sx={{ width: '100%' }} spacing={2}>
			{/* //can also dynamically change severity values to display success/warnings */}
			<Alert severity="info">{props.message}</Alert>
		</Stack>
	);
}

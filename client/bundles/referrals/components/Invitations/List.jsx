import * as React from 'react';
import { styled } from '@mui/material/styles';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell, { tableCellClasses } from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import Button from '@mui/material/Button';
import Container from '@mui/material/Container';
import Typography from '@mui/material/Typography';
import Link from '@mui/material/Link';
import AddCircleOutlineIcon from '@mui/icons-material/AddCircleOutline';
import { isEmpty } from 'lodash';

const StyledTableCell = styled(TableCell)(({ theme }) => ({
	[`&.${tableCellClasses.head}`]: {
		backgroundColor: theme.palette.common.black,
		color: theme.palette.common.white,
	},
	[`&.${tableCellClasses.body}`]: {
		fontSize: 14,
	},
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
	'&:nth-of-type(odd)': {
		backgroundColor: theme.palette.action.hover,
	},
	// hide last border
	'&:last-child td, &:last-child th': {
		border: 0,
	},
}));

export default function CustomizedTables(props) {
	const { data, new_invitation_link } = props
	const rows = data.invitations;
	if (!isEmpty(rows)) {
		return (
			<Container>
				<Button variant="contained" href={new_invitation_link} sx={{ mt: 8, mb: 4 }}>
					<AddCircleOutlineIcon sx={{ mr: 2 }} /> Send New Invitation
				</Button>
				<TableContainer component={Paper} sx={{ mt: 8, mb: 4 }}>
					<Table sx={{ minWidth: 700 }} aria-label="customized table">
						<TableHead>
							<TableRow>
								<StyledTableCell>Invitation Sent To</StyledTableCell>
								<StyledTableCell align="right">Accepted?</StyledTableCell>
								<StyledTableCell align="right">Sent At</StyledTableCell>
							</TableRow>
						</TableHead>
						<TableBody>
							{rows.map((row) => (
								<StyledTableRow key={row.email}>
									<StyledTableCell component="th" scope="row">
										{row.email}
									</StyledTableCell>
									<StyledTableCell align="right">{row.accepted ? 'True' : 'False'}</StyledTableCell>
									<StyledTableCell align="right">{row.sent_at}</StyledTableCell>
								</StyledTableRow>
							))}
						</TableBody>
					</Table>
				</TableContainer>
			</Container>
		);
	} else {
		<Container sx={{ mt: 8, mb: 4 }}>
			<Typography variant="h5" align="center" color="text.secondary" component="p">
				No Invitations Sent.
			</Typography>
			<Link href={new_invitation_link} variant="subtitle1" color="text.secondary">
				Invite Now!
			</Link>
		</Container>
	}
}
